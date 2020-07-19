#! /bin/bash

echo \# Table Of Content > README.md
echo >> README.md
echo \[Link to original video by freeCodeCamp.org on YouTube\]\(https:\/\/www.youtube.com\/watch?v=RBSGKlAvoiM\) >> README.md
echo >> README.md


ls | grep [0-9].*.md | sed "s|\(.*\)|[\1](\1)\n|" >> README.md


