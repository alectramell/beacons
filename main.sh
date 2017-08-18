#!/bin/bash

clear

RELOAD() {

	clear
	echo "OFF" > $(pwd)/status.txt
	sleep 0.5
	clear
	echo "ON" > $(pwd)/status.txt
	sleep 0.5
	clear
	echo "..ATTEMPTING TO GATHER BEACONS.." | pv -qL 10
	sleep 5
	clear
	bash $(pwd)/main.sh
}

clear

if [ $(date +%S) -lt 30 ]
then
	RELOAD
else
	clear
fi

clear

TAG=$((1 + RANDOM % 3))

red=$(tput setaf 1)
yellow=$(tput setaf 190)
green=$(tput setaf 2)
reset=$(tput sgr0)

clear

while [ $(cat $(pwd)/status.txt) = "ON" ]
do

if [ $(date +%S) -lt 30 ]
then
	RELOAD
else
	clear
fi

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

	echo -n "BEACONS (${red}red${reset}) = "
	echo "$POP" | pv -qL 10
	sleep 5

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

	echo -n "BEACONS (${yellow}yellow${reset}) = "
	echo "$POP" | pv -qL 10
	sleep 5

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

	echo -n "BEACONS (${green}green${reset}) = "
	echo "$POP" | pv -qL 10
	sleep 5
fi

done

