#!/usr/bin/env bash

CACHE_DIR=~/prog

# ACL2 is built from source at a pinned release tag.  The prebuilt image we
# used to download (acl2-image-8.0-linux.x86_64.tar.gz from acl2s.ccs.neu.edu)
# is no longer reachable, and that host serves no HTTPS at all, so building
# from the tagged sources is the reproducible option.
ACL2_REPO=https://github.com/acl2/acl2.git
ACL2_TAG=8.0
ACL2_DIR=$CACHE_DIR/acl2

# Common Lisp used to build ACL2.  Override with e.g. LISP=ccl.
LISP=${LISP:-sbcl}

RUN_ACL2=$ACL2_DIR/saved_acl2
CERT_PL=$ACL2_DIR/books/build/cert.pl

# cert.pl resolves ":dir :system" includes against this.
ACL2_SYSTEM_BOOKS=$ACL2_DIR/books
export ACL2_SYSTEM_BOOKS
