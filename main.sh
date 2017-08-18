#!/bin/bash

clear

TAG=$((1 + RANDOM % 3))

clear

while [ $(cat $(pwd)/status.txt) = "ON" ]
do

TAG=$((1 + RANDOM % 3))

if [ $TAG -eq 1 ]
then
	clear
	rm $(pwd)/001.bcn
	clear
	wget --quiet https://raw.githubusercontent.com/alectramell/beacons/master/001.bcn -O $(pwd)/001.bcn
	clear

	PXP=$(wc -c < $(pwd)/001.bcn)
	POP=$PXP

	clear

	echo "BEACONS = $POP"
	sleep 3

elif [ $TAG -eq 2 ]
then
	clear
	rm $(pwd)/002.bcn
	clear
	wget --quiet https://raw.githubusercontent.com/alectramell/beacons/master/002.bcn -O $(pwd)/002.bcn
	clear

	PXP=$(wc -c < $(pwd)/002.bcn)
	POP=$PXP

	clear

	echo "BEACONS = $POP"
	sleep 3

elif [ $TAG -eq 3 ]
then
	clear
	rm $(pwd)/003.bcn
	clear
	wget --quiet https://raw.githubusercontent.com/alectramell/beacons/master/003.bcn -O $(pwd)/003.bcn
	clear

	PXP=$(wc -c < $(pwd)/003.bcn)
	POP=$PXP

	clear

	echo "BEACONS = $POP"
	sleep 3
fi

done

