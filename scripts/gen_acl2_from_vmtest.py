#!/usr/bin/env python3
import argparse
import json
import textwrap

from pprint import pprint

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
        mk_context = mk_context_template.format(
            ia=int(details['exec']['address'], base=16),
            io=int(details['exec']['origin'], base=16),
            ip=int(details['exec']['gasPrice'], base=16),
            id_='"' + details['exec']['data'] + '"',
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


        print(mk_env)

        pprint(details['pre'])
        print('='*80)
        pprint(details['gas'])
        print('-'*80)
        pprint(details['logs'])
        print('-'*80)
        pprint(details['out'])
        print('-'*80)
        pprint(details['post'])
        print('-'*80)
        pprint(details['callcreates'])

if __name__ == "__main__":
    main()
