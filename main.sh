#!/bin/bash

clear

TAG=$((1 + RANDOM % 3))

red=$(tput setaf 1)
yellow=$(tput setaf 190)
green=$(tput setaf 2)
reset=$(tput sgr0)

clear

while [ $(cat $(pwd)/status.txt) = "ON" ]
do

TAG=$((1 + RANDOM % 3))

if [ $TAG -eq 1 ]
then
	clear
	rm $(pwd)/red.bcn
	clear
	wget --quiet https://raw.githubusercontent.com/alectramell/beacons/master/red.bcn -O $(pwd)/red.bcn
	clear

	PXP=$(wc -c < $(pwd)/red.bcn)
	POP=$PXP

	clear

	echo "BEACONS (${red}red${reset}) = $POP"
	sleep 3

elif [ $TAG -eq 2 ]
then
	clear
	rm $(pwd)/yellow.bcn
	clear
	wget --quiet https://raw.githubusercontent.com/alectramell/beacons/master/yellow.bcn -O $(pwd)/yellow.bcn
	clear

	PXP=$(wc -c < $(pwd)/yellow.bcn)
	POP=$PXP

	clear

	echo "BEACONS (${yellow}yellow${reset}) = $POP"
	sleep 3

elif [ $TAG -eq 3 ]
then
	clear
	rm $(pwd)/green.bcn
	clear
	wget --quiet https://raw.githubusercontent.com/alectramell/beacons/master/green.bcn -O $(pwd)/green.bcn
	clear

	PXP=$(wc -c < $(pwd)/green.bcn)
	POP=$PXP

	clear

	echo "BEACONS (${green}green${reset}) = $POP"
	sleep 3
fi

done

