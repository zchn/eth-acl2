#!/bin/bash

find pyacl2 -name "*.py"  -exec pyformat --in-place \{\} \;
