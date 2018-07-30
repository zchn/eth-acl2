#!/bin/bash

acl2 << MSG
(include-book "centaur/bridge/top" :dir :system)
(bridge::start "/tmp/acl2-socket")
MSG
