#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for `pyacl2` package."""

import pytest

from click.testing import CliRunner

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

def test_command_line_interface():
    """Test the CLI."""
    runner = CliRunner()
    result = runner.invoke(cli.main)
    assert result.exit_code == 0
    assert 'pyacl2.cli.main' in result.output
    help_result = runner.invoke(cli.main, ['--help'])
    assert help_result.exit_code == 0
    assert '--help  Show this message and exit.' in help_result.output
