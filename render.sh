#!/bin/bash

clear

echo -n "STATUS (o=on, x=off): "
read -s -n1 STATUS

clear

if [ $STATUS = "o" ]
then
	echo "ON" > $(pwd)/status.txt
	clear
	echo "STATUS=ON" | pv -qL 10
	sleep 1.0

elif [ $STATUS = "x" ]
then
	echo "OFF" > $(pwd)/status.txt
	clear
	echo "STATUS=OFF" | pv -qL 10
	sleep 1.0
else
	echo "STATUS=VOID"
	sleep 1.0
	clear
	exit
fi

clear

git add $(pwd)/*.bcn
git add $(pwd)/*.sh
git add $(pwd)/*.py
git add $(pwd)/*.txt

clear

git commit -m "beacons"

clear

git push origin master
