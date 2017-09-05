#!/bin/bash

clear

UPDATES=$(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/updates.txt)

clear

echo "$UPDATES" | pg

clear
