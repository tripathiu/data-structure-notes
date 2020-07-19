#! /bin/bash

echo Table Of Content > README.md
echo >> README.md

ls | grep [0-9].*.md | sed "s|\(.*\)|[\1](\1)|" >> README.md


