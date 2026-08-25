#!/usr/bin/env bash

set -euo pipefail
set -x

source ./scripts/vars.sh

mkdir -p "$CACHE_DIR"

if [ -x "$RUN_ACL2" ]; then
    echo "Reusing ACL2 image: $RUN_ACL2"
    exit 0
fi

# ACL2 is compiled by a host Common Lisp, so make sure one is present.
if ! command -v "$LISP" > /dev/null 2>&1; then
    if [ "$LISP" = "sbcl" ] && command -v apt-get > /dev/null 2>&1; then
        SUDO=""
        if [ "$(id -u)" -ne 0 ]; then SUDO=sudo; fi
        $SUDO apt-get update
        $SUDO apt-get install -y sbcl
    else
        echo "error: $LISP not found; install it or set LISP to a Common Lisp"\
             "that ACL2 supports." >&2
        exit 1
    fi
fi

if [ -d "$ACL2_DIR/.git" ]; then
    echo "Reusing ACL2 checkout: $ACL2_DIR"
else
    rm -rf "$ACL2_DIR"
    git clone --depth 1 --branch "$ACL2_TAG" "$ACL2_REPO" "$ACL2_DIR"
fi

# Builds $ACL2_DIR/saved_acl2.  Takes ~15 minutes; the community books are
# certified later, on demand, by cert.pl in build.sh.
make -C "$ACL2_DIR" LISP="$LISP"

test -x "$RUN_ACL2"
