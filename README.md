# eth-acl2 [![Build Status](https://travis-ci.org/zchn/eth-acl2.svg?branch=master)](https://travis-ci.org/zchn/eth-acl2)

An ACL2 formalisation of the Ethereum Virtual Machine.

## Target: the Byzantium hard fork

This model targets the EVM as specified for the **Byzantium** hard fork, which
on Ethereum mainnet covers **blocks 4,370,000 through 7,279,999** (Byzantium
activated at block 4,370,000; Constantinople/Petersburg superseded it at block
7,280,000). Behaviour outside that range is out of scope: neither pre-Byzantium
rules nor anything introduced by Constantinople or later is modelled, and no
attempt is made to keep up with subsequent forks.

Concretely, this means:

* The opcode table in `books/evm/op.lisp` is the Byzantium instruction set.
  Opcodes added after Byzantium — `SHL`/`SHR`/`SAR`, `CREATE2` and
  `EXTCODEHASH` (Constantinople), `CHAINID` and `SELFBALANCE` (Istanbul),
  `BASEFEE`, `PUSH0`, `MCOPY`, `TLOAD`/`TSTORE` and later additions — are
  deliberately absent, and executing one halts the machine as `unknown`.
* `DIFFICULTY` (`0x44`) has its pre-Merge meaning, not the post-Merge
  `PREVRANDAO` reinterpretation.
* Tests are generated from the `VMTests` fixtures of the `ethereum/tests`
  repository (see `scripts/gen_acl2_from_vmtest.py`), which are written against
  these rules.

## Status

This is still a prototype, and Byzantium is not yet covered in full. See
issue #1, issue #2 and issue #3 for things to do to make it complete.

Known gaps within the target fork:

* Three Byzantium opcodes are not in the opcode table yet: `RETURNDATASIZE`
  (`0x3d`), `RETURNDATACOPY` (`0x3e`) and `STATICCALL` (`0xfa`).
* Several opcodes are recognised but halt as `unsupported` rather than being
  modelled: `SHA3`, `BALANCE`, `EXTCODESIZE`, `EXTCODECOPY`, `BLOCKHASH`,
  `CREATE`, `CALL`, `CALLCODE` and `DELEGATECALL`.
* Gas is carried in the machine state and readable via `GAS`, but instructions
  do not charge for it, so the fork's gas schedule is not modelled.

In addition to that, Kevin is primarily focusing on #4 and #5.

Long term, #6 is also desirable.

## Building

`./scripts/install-deps.sh` builds ACL2 at the tag pinned in `scripts/vars.sh`,
and `./scripts/build.sh` certifies the books under `books/evm` — which is to
say, it re-checks every proof and every test.
