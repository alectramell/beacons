#!/bin/bash

clear

git add $(pwd)/*.sh
git add $(pwd)/*.py
git add $(pwd)/*.txt
git add $(pwd)/*.md

clear

git commit -m "beacons"

clear

git push origin master

clear
