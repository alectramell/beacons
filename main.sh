#!/bin/bash

clear

echo -n "beacon: "
read TAG

clear

PXP=$(wc -w < $(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/$TAG.bcn))
POP=$PXP

while [ $POP -gt 5 ]
do
	echo -n "$TAG = "
	echo "$POP"
	sleep 1.5
	clear
done

