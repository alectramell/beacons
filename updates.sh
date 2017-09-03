#!/bin/bash

clear

UPDATES=$(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/updates.txt)

clear

notify-send --urgency="critical" --icon="/home/$(whoami)/icons/admshell.svg" "$UPDATES" "https://www.facebook.com/apollondma" &

clear
