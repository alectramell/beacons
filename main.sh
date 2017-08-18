#!/bin/bash

clear

echo -n "beacon: "
read TAG

clear

rm $(pwd)/$TAG.bcn

clear

wget --quiet https://raw.githubusercontent.com/alectramell/beacons/master/$TAG.bcn -O $(pwd)/$TAG.bcn

clear

PXP=$(wc -c < $(pwd)/$TAG.bcn)
POP=$PXP

while [ $POP -gt 5 ]
do
	echo -n "$TAG = "
	echo "$POP"
	sleep 1.5
	clear
done

