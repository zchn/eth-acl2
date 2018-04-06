#!/bin/bash

CACHE_DIR=~/prog
RUN_ACL2=$CACHE_DIR/acl2-image-8.0-linux.x86_64/run_acl2
CERT_PL=$CACHE_DIR/acl2-image-8.0-linux.x86_64/books/build/cert.pl
ACL2_TARBALL=$CACHE_DIR/acl2-image-8.0-linux.x86_64.tar.gz
ACL2_TARBALL_URL=http://acl2s.ccs.neu.edu/acl2s/src/acl2/acl2-image-8.0-linux.x86_64.tar.gz

if [ -f $RUN_ACL2 ]; then
    echo "Reusing run_acl2:" "$RUN_ACL2"
else
    if [ -f $ACL2_TARBALL ]; then
        echo "Reusing acl2 tarball:" "$ACL2_TARBALL"
    else
        wget "$ACL2_TARBALL_URL" -O "$ACL2_TARBAL"
    fi
fi
cd books/evm
$CERT_PL -j 8 --acl2 $RUN_ACL2 evm-book
