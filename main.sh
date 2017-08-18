#!/bin/bash

echo -n "beacon: "
read NAME

TAG=$(sed '1!d' $(pwd)/$NAME.bcn)
PXP=$(wc -w < <(curl -s <URL>/$NAME.bcn)
POP=$PXP

while [ $POP -gt 5 ]
do
	if [ $NAME -eq "$TAG" ]
	then
		echo -n "$TAG = "
		echo "$POP"
		sleep 1.5
		clear
	else
		echo "NO TAG"
		sleep 1.5
		clear
	fi
done

