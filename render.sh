#!/bin/bash

clear

echo -n "ACTIVE STATUS (t/f): "
read -s -n1 STATUS

clear

if [ $STATUS = "t" ]
then
	echo "ON" > $(pwd)/status.txt
	clear
	echo "ACTIVE STATUS = TRUE" | pv -qL 10
	sleep 1.0

elif [ $STATUS = "f" ]
then
	echo "OFF" > $(pwd)/status.txt
	clear
	echo "ACTIVE STATUS = FALSE" | pv -qL 10
	sleep 1.0
else
	echo "ACTIVE STATUS = VOID"
	sleep 1.0
	clear
	exit
fi

clear

git add $(pwd)/*.bcn
git add $(pwd)/*.sh
git add $(pwd)/*.py
git add $(pwd)/*.txt
git add $(pwd)/*.md

clear

git commit -m "beacons"

clear

git push origin master

clear
