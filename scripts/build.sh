#!/usr/bin/env bash

source ./scripts/vars.sh && \
  cd books/evm && \
  $CERT_PL -j 8 --acl2 $RUN_ACL2 evm-book
