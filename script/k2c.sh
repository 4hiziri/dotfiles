#!/bin/bash
cat $1 | nkf | grep 'k /' | grep -v '^[0-9a-zA-Z\-]* /' | sed 's|k /|c /|g' | nkf -e
