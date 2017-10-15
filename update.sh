#!/bin/bash

clear

git add *.sh
git add *.txt
git add *.md
git add *.png
git add *.svg
git add *.js
git commit -m "beacons"
git push origin master

clear

echo "DONE!" | pv -qL 5

sleep 0.5
