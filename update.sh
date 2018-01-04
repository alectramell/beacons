#!/bin/bash

clear

git add *.sh
git add *.txt
git add *.md
git add *.png
git add *.svg
git add *.js
git add athena
git commit -m "beacons"
git push origin master

clear

echo "SCRIPTS UPDATED!" | pv -qL 5

sleep 0.5
