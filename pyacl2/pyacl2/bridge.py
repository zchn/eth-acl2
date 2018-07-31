import logging
import re
import socket

from sexpdata import (
    dumps,
    loads,
)

from typing import (
    Any,
    Dict,
    NamedTuple,
    Optional,
    Text,
    Tuple,
)

_L = logging.getLogger(__name__)

SexpType = Any


class SexpEvalResult(NamedTuple):
    sexp: SexpType
    stdout: Text = ''


class StrEvalResult(NamedTuple):
    ret: Text
    stdout: Text = ''


class ACL2Bridge:

    def __init__(self, sock_addr: Text) -> 'ACL2Bridge':
        self.sock_addr = sock_addr
        self.sock = None  # type: Any
        self._message_buffer = ''

    def connect(self) -> None:
        _L.info('Connecting to {}.'.format(self.sock_addr))
        self.sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        self.sock.connect(self.sock_addr)
        mtype, mbody = self.read_message()
        assert mtype == 'ACL2_BRIDGE_HELLO'
        _L.info('hello message: {}'.format((mtype, mbody)))

        _L.info('ready message: {}'.format(self.read_message()))

    def close(self) -> None:
        self.sock.close()

    #### Basic Interaction ####

    def send_command(self, mtype: Text, cmd: Text) -> None:
        msg_format = '{mtype} {mlen}\n{cmd}\n'
        self.sock.sendall(msg_format.format(
            mtype=mtype, mlen=len(cmd), cmd=cmd).encode('utf-8'))

    def read_message(self) -> (Text, Text):
        msg_type, msg_len = self._extract_header()
        msg_body = self._extract_body(msg_len)
        return msg_type, msg_body

    def send_lisp_command(self, cmd: Text) -> None:
        self.send_command('LISP', cmd)

    #### Easy Interaction ####

    # def read_return(self) -> None:
    #     mtype, mbody = self.read_message()
    #     if mtype != 'RETURN':
    #         raise ValueError('Expecting RETURN, got {}.'.format((mtype, mbody)))
    #     return mbody

    # def read_ready(self) -> None:
    #     mtype, mbody = self.read_message()
    #     if mtype != 'READY':
    #         raise ValueError('Expecting READY, got {}.'.format((mtype, mbody)))

    def eval_sexp(self, sexp: SexpType) -> SexpEvalResult:
        sexp_string = dumps(sexp)
        result = self.eval_string(sexp_string)
        return SexpEvalResult(sexp=loads(result.ret), stdout=result.stdout)

    def eval_string(self, sexp_string: Text) -> Text:
        self.send_lisp_command(sexp_string)
        ret = None
        stdout = ''
        error = []
        while True:
            mtype, mbody = self.read_message()
            if mtype == 'READY':
                break
            elif mtype == 'RETURN':
                assert ret is None
                ret = mbody
            elif mtype == 'STDOUT':
                stdout += mbody
            elif mtype == 'ERROR':
                error.append(mbody)
            else:
                raise ValueError(
                    'Unexpected output: {}'.format((mtype, mbody)))
        if error:
            raise ValueError('ERROR: {}, ret so far: {}, stdout so far: {}'
                             .format(error, ret, stdout))
        return StrEvalResult(ret=ret, stdout=stdout)

    #### Internal Helpers ####

    def _fill_buffer(self) -> None:
        assert self.sock is not None
        new_content = self.sock.recv(1024).decode('utf-8')
        _L.debug('Got {}'.format(new_content))
        self._message_buffer += new_content

    def _try_extract_header(self) -> Optional[Tuple[Text, int]]:
        _L.debug('message buffer is {}'.format(self._message_buffer))
        matched_header = re.match(
            r'(?s)(?P<type>[A-Za-z][A-Za-z0-9_]*) (?P<len>[0-9]+)\n(?P<remainder>.*)',
            self._message_buffer)
        _L.debug('Header matching result {}'.format(matched_header))
        if not matched_header:
            return None
        else:
            self._message_buffer = matched_header.group(
                'remainder')  # type: Text
            msg_type = matched_header.group('type')  # type: Text
            msg_len = int(matched_header.group('len'))  # type: int
            return (msg_type, msg_len)

    def _extract_header(self) -> (Text, int):
        maybe_header = self._try_extract_header()
        while maybe_header is None:
            self._fill_buffer()
            maybe_header = self._try_extract_header()
        return maybe_header

    def _extract_body(self, msg_len: int) -> Text:
        # +1 because there is an extra newline at the end of the
        # message body.
        while len(self._message_buffer) < msg_len+1:
            self._fill_buffer()
        result = self._message_buffer[:msg_len]
        self._message_buffer = self._message_buffer[msg_len+1:]
        return result
