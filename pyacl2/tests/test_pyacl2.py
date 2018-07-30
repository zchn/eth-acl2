#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `pyacl2` package."""

import pytest

from click.testing import CliRunner
from sexpdata import Symbol

from pyacl2 import pyacl2
from pyacl2 import cli


@pytest.fixture
def default_bridge():
    """An ACL2Bridge instance that contects to /tmp/acl2-socket."""
    bridge = pyacl2.ACL2Bridge('/tmp/acl2-socket')
    bridge.connect()
    return bridge


def test_connect_close():
    """Testing ACL2Bridge.connect."""
    bridge = pyacl2.ACL2Bridge('/tmp/acl2-socket')
    bridge.connect()
    bridge.close()


def test_send_read_message(default_bridge):
    """Sending and reading simple messages."""
    default_bridge.send_lisp_command('(+ 1987 3)')
    assert default_bridge.read_message() == ('RETURN', '1990')
    assert default_bridge.read_message() == ('READY', '')

    default_bridge.send_lisp_command('(list 1987 3)')
    assert default_bridge.read_message() == ('RETURN', '(1987 3)')
    assert default_bridge.read_message() == ('READY', '')


def test_send_read_invalid_sexp(default_bridge):
    """Sending invalid sexp and reading the response."""
    default_bridge.send_lisp_command('(+ 1987 3')
    mtype, mbody = default_bridge.read_message()
    assert mtype == 'ERROR'
    assert mbody.startswith('Error during read-command:\nUnexpected end of file on #<STRING-INPUT-STREAM  :CLOSED')
    assert default_bridge.read_message() == ('READY', '')

def test_eval_string(default_bridge):
    """test_eval_string."""
    assert default_bridge.eval_string('10') == '10'
    assert default_bridge.eval_string('(* 2 3)') == '6'
    assert default_bridge.eval_string('(list \'a 5 "b")') == '(A 5 "b")'

def test_eval_sexp(default_bridge):
    """test_eval_sexp."""
    assert default_bridge.eval_sexp(11) == 11
    assert default_bridge.eval_sexp('a') == 'a'
    assert default_bridge.eval_sexp([Symbol('list'), 1, 'a', True]) == [1, 'a', Symbol('T')]

def test_command_line_interface():
    """Test the CLI."""
    runner = CliRunner()
    result = runner.invoke(cli.main)
    assert result.exit_code == 0
    assert 'pyacl2.cli.main' in result.output
    help_result = runner.invoke(cli.main, ['--help'])
    assert help_result.exit_code == 0
    assert '--help  Show this message and exit.' in help_result.output
