#!/bin/bash

clear

wget -A="svg" -N -O /home/$(whoami)/admshell.svg https://raw.githubusercontent.com/alectramell/beacons/master/admshell.svg

clear

UPDATES=$(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/updates.txt)

clear

notify-send --urgency="critical" --icon="/home/$(whoami)/admshell.svg" "$UPDATES" "www.facebook.com/apollondma" &

clear
