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
    return pyacl2.ACL2Bridge('/tmp/acl2-socket')


def test_connect_close(default_bridge):
    """Testing ACL2Bridge.conntect."""
    default_bridge.connect()
    default_bridge.close()


def test_command_line_interface():
    """Test the CLI."""
    runner = CliRunner()
    result = runner.invoke(cli.main)
    assert result.exit_code == 0
    assert 'pyacl2.cli.main' in result.output
    help_result = runner.invoke(cli.main, ['--help'])
    assert help_result.exit_code == 0
    assert '--help  Show this message and exit.' in help_result.output
