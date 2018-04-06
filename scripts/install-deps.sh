#!/usr/bin/env bash

set -x

source ./scripts/vars.sh && \
if [ -f $RUN_ACL2 ]; then
    echo "Reusing run_acl2:" "$RUN_ACL2"
else
    if [ -f $ACL2_TARBALL ]; then
        echo "Reusing acl2 tarball:" "$ACL2_TARBALL"
    else
        wget "$ACL2_TARBALL_URL" -O "$ACL2_TARBAL"
    fi
fi
