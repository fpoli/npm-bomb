#!/bin/bash

cat << EOF
{
  "name": "npm-bomb",
  "version": "0.1.2",
  "description": "NPM package with a lot of dependencies.",
  "main": "index.js",
  "author": "",
  "license": "MIT",
  "dependencies": {
EOF

all-the-package-names \
  | grep -v "^npm-bomb$" \
  | grep -v '[A-Z]\|^\.\|^_\|~\|(\|)\|!\|*\|^ \| $\||\|{\|}\|"' \
  | grep -v "'" \
  | grep '^[a-z0-9_.*~-]*$\|^@[a-z0-9_.*~-]*/[a-z0-9_.*~-]*$' \
  | sed 's/^/    "/;s/$/": "*",/' \
  | head -n 999

cat << EOF
    "npm-bomb": "*"
  }
}
EOF
