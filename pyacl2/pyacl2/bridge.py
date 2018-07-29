import logging
import re
import socket

from typing import (
    Any,
    Dict,
    NamedTuple,
    Optional,
    Tuple,
)

_L = logging.getLogger(__name__)

class ACL2Bridge:

    def __init__(self, sock_addr: str) -> 'ACL2Bridge':
        self.sock_addr = sock_addr
        self.sock = None  # type: Any
        self._message_buffer = ''

    def connect(self) -> None:
        _L.warning('Connecting to {}.'.format(self.sock_addr))
        self.sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        self.sock.connect(self.sock_addr)

        mtype, mbody = self.read_message()
        assert mtype == 'ACL2_BRIDGE_HELLO'
        _L.warning('hello message: {}'.format((mtype, mbody)))

        _L.warning('ready message: {}'.format(self.read_message()))

    def close(self) -> None:
        self.sock.close()

    def send_command(self, mtype, cmd) -> None:
        msg_format = '{mtype} {mlen}\n{cmd}\n'
        self.sock.sendall(msg_format.format(mtype=mtype, mlen=len(cmd), cmd=cmd).encode('utf-8'))

    def _fill_buffer(self) -> None:
        assert self.sock is not None
        new_content = self.sock.recv(1024).decode('utf-8')
        _L.warning('Got {}'.format(new_content))
        self._message_buffer += new_content

    def _try_extract_header(self) -> Optional[Tuple[str, int]]:
        _L.warning('message buffer is {}'.format(self._message_buffer))
        matched_header = re.match(
            r'(?s)(?P<type>[A-Za-z][A-Za-z0-9_]*) (?P<len>[0-9]+)\n(?P<remainder>.*)',
            self._message_buffer)
        _L.warning('Header matching result {}'.format(matched_header))
        if not matched_header:
            return None
        else:
            self._message_buffer = matched_header.group(
                'remainder')  # type: str
            msg_type = matched_header.group('type')  # type: str
            msg_len = int(matched_header.group('len'))  # type: int
            return (msg_type, msg_len)

    def _extract_header(self) -> (str, int):
        maybe_header = self._try_extract_header()
        while maybe_header is None:
            self._fill_buffer()
            maybe_header = self._try_extract_header()
        return maybe_header

    def _extract_body(self, msg_len: int) -> str:
        # +1 because there is an extra newline at the end of the
        # message body.
        while len(self._message_buffer) < msg_len+1:
            self._fill_buffer()
        result = self._message_buffer[:msg_len]
        self._message_buffer = self._message_buffer[msg_len+1:]
        return result

    def read_message(self) -> (str, str):
        msg_type, msg_len = self._extract_header()
        msg_body = self._extract_body(msg_len)
        return msg_type, msg_body