#!/bin/sh
DOCSET=Intel_x86_IA32
wget --verbose --mirror --no-host-directories --cut-dirs 1 --page-requisites \
     --convert-links --no-parent \
     --directory-prefix "${DOCSET}.docset/Contents/Resources/Documents/" \
     "http://www.felixcloutier.com/x86/"
rm "${DOCSET}.docset/Contents/Resources/Documents/robots.txt"
./x86doc2docset.py
tar --exclude=".DS_Store" -cvzf "${DOCSET}.tgz" "${DOCSET}.docset"
