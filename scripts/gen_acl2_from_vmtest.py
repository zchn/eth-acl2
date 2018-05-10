#!/usr/bin/env python3
import argparse
import copy
import json
import logging
import os
import textwrap

logging.basicConfig(level=logging.INFO)

def make_storage_update(storage_update, content):
    if 'storage' not in content:
        return storage_update

    storage_update_template = textwrap.dedent('''
       (env/storage/store {src_env}
                          {offset}
                          {value})''')

    for offset,value in content['storage'].items():
        storage_update = storage_update_template.format(
            src_env=textwrap.indent(storage_update, '  '),
            offset=int(offset, base=16),
            value=int(value, base=16))

    del content['storage']
    if len(content.keys()) != 0:
        logging.info('Unsupported: {}'.format(sorted(content.keys())))

    return storage_update

def make_halt_update(src_env, out_string):
    if out_string is None:
        return src_env
    if out_string == '0x':
        return ('(env/set-halted {src_env} '
                '(cons \'out-of-range "Halted: pc out of range."))'
                .format(src_env=src_env))
    if out_string.startswith('0x'):
        out_string = out_string[2:]
    halt_update_temlate = textwrap.dedent('''
        (env/set-halted {src_env}
                        (cons 'return {out_list}))''')
    out_list_elems = ['list']
    for i in range(int(len(out_string)/2)):
        out_list_elems.append('#x'+out_string[i*2:i*2+2])
    halt_update = halt_update_temlate.format(
        src_env=textwrap.indent(src_env, '  '),
        out_list='(' + ' '.join(out_list_elems) + ')')
    return halt_update

def make_pre_or_post(test_name, defun_name, my_address, pre_post_details,
                     out_string):

    storage_update = '(mk-initial-env-{})'.format(test_name)
    for address, content in pre_post_details.items():
        if int(address, base=16) != int(my_address, base=16):
            logging.info('non-self address is not supported: {} {}'
                         .format('<omitted>' or address,
                                 '<omitted>' or content))
            continue
        storage_update = make_storage_update(storage_update,
                                                     content)

    updates = make_halt_update(storage_update, out_string)

    defun_template = textwrap.dedent('''
        (defun {defun_name} ()
          {updates})''')

    defun = defun_template.format(
        defun_name=defun_name,
        updates=textwrap.indent(updates, '  '))

    return defun

def main():
    parser = argparse.ArgumentParser(
        description='Generate an eth-acl2 stub from a json VMTest file.')
    parser.add_argument('infile',
                        help='where to read the json VMTest file.')
    args = parser.parse_args()

    data_file = open(args.infile)
    data = json.load(data_file)
    for test_name, details in data.items():
        mk_substate_template = textwrap.dedent('''
            (mk-substate
              ;; suiside
              {suicide}
              ;; log
              {log}
              ;; touched
              {touched}
              ;; refund
              {refund})''')
        mk_substate = mk_substate_template.format(
            suicide='nil',
            log='nil',
            touched='nil',
            refund='0')

        mk_block_header_template = textwrap.dedent('''
            (mk-block-header
              ;; ihc
              {ihc}
              ;; ihs
              {ihs}
              ;; ihi
              {ihi}
              ;; ihd
              {ihd}
              ;; ihl
              {ihl})''')
        mk_block_header = mk_block_header_template.format(
            ihc=int(details['env']['currentCoinbase'], base=16),
            ihs=int(details['env']['currentTimestamp'], base=16),
            ihi=int(details['env']['currentNumber'], base=16),
            ihd=int(details['env']['currentDifficulty'], base=16),
            ihl=int(details['env']['currentGasLimit'], base=16)
        )

        for key in ['currentCoinbase', 'currentTimestamp', 'currentNumber',
                    'currentDifficulty', 'currentGasLimit']:
            del details['env'][key]
        if len(details['env'].keys()) != 0:
            logging.info('Unsupported: env.{}'
                         .format(sorted(details['env'].keys())))

        mk_context_template = textwrap.dedent('''
            (mk-context
              ;; ia
              {ia}
              ;; io
              {io}
              ;; ip
              {ip}
              ;; id
              {id_}
              ;; is
              {is_}
              ;; iv
              {iv}
              ;; ih
              {ih}
              ;; ie
               {ie}
              ;; iw
              {iw})''')

        if 'data' in details['exec']:
            if details['exec']['data'] != '0x':
                logging.info('Unsupported: exec.data: {}'
                             .format('<omitted>' or details['exec']['data']))
            del details['exec']['data']

        mk_context = mk_context_template.format(
            ia=int(details['exec']['address'], base=16),
            io=int(details['exec']['origin'], base=16),
            ip=int(details['exec']['gasPrice'], base=16),
            id_='nil',
            is_=int(details['exec']['caller'], base=16),
            iv=int(details['exec']['value'], base=16),
            ih=textwrap.indent(mk_block_header, '  '),
            ie='"<call/create stack height>"',
            iw='"<permission>"')

        mk_rom_template = '''(mk-rom {opstring})'''
        mk_rom = mk_rom_template.format(
            opstring='"' + details['exec']['code'][2:] + '"')

        mk_env_template = textwrap.dedent('''
            (mk-env
              ;; pc
              {pc}
              ;; rom
              {rom}
              ;; stack
              {stack}
              ;; mem
              {mem}
              ;; storage
              {storage}
              ;; halted
              {halted}
              ;; gas
              {gas}
              ;; context
              {context}
              ;; substate
              {substate})''')
        mk_env = mk_env_template.format(
            pc=0,
            rom=mk_rom,
            stack="(mk-empty-stack)",
            mem="(mk-empty-memory)",
            storage="(mk-empty-storage)",
            halted="nil",
            gas=int(details['exec']['gas'], base=16),
            context=textwrap.indent(mk_context, '  '),
            substate=textwrap.indent(mk_substate, '  '))

        defun = "(defun mk-initial-env-{test_name} ()\n{mk_env})".format(
            test_name=test_name,
            mk_env=textwrap.indent(mk_env, '  '))

        defpre = make_pre_or_post(test_name,
                                  'env-with-pre-{}'.format(test_name),
                                  details['exec']['address'],
                                  details['pre'], None)

        if 'post' not in details:
            details['post'] = copy.deepcopy(details['pre'])

        if 'out' not in details:
            details['out'] = '0x'

        defpost = make_pre_or_post(test_name,
                                   'env-with-post-{}'.format(test_name),
                                   details['exec']['address'],
                                   details['post'], details['out'])

        file_template = textwrap.dedent('''
            (in-package "ACL2")

            (include-book "../../env")
            (include-book "../../exec")
            (include-book "../helper")

            {init_env}
            {defpre}
            {defpost}

            (defthm expect-{test_name}
              (expected-env-p (env/exec (env-with-pre-{test_name}))
                              (env-with-post-{test_name})))''')

        file_content = file_template.format(
            test_name=test_name,
            init_env=defun,
            defpre=defpre,
            defpost=defpost)

        outdir = os.path.join('tmp', os.path.dirname(args.infile))
        if not os.path.exists(outdir):
            os.makedirs(outdir)
        outfile = open(outdir+'/'+test_name+'.lisp', 'w')
        outfile.write(file_content)
        outfile.close()

        listfile = open('tmp/testlist.lisp', 'a')
        listfile.write('(include-book "{}")\n'.format(outdir+'/'+test_name))
        listfile.close()

        for key in ['address', 'origin', 'gasPrice', 'caller', 'value',
                    'gas', 'code']:
            del details['exec'][key]
        if len(details['exec'].keys()) != 0:
            logging.info('Unsupported: exec.{}'.format(
                sorted(details['exec'].keys())))

        for key in ['env', 'exec', 'pre', 'post', 'out']:
            del details[key]
        if len(details.keys()) != 0:
            logging.info('Unsupported: {}'.format(sorted(details.keys())))

if __name__ == "__main__":
    main()
