#!/bin/bash

clear

wget -nc https://raw.githubusercontent.com/alectramell/beacons/master/voodoo.svg -O /home/$(whoami)/.voodoo.svg

clear

red=$(tput setaf 1)
green=$(tput setaf 2)
white=$(tput setaf 7)
bold=$(tput bold)
reset=$(tput sgr0)

clear

DLIB=($(df -h /dev/sda2 | grep "/dev/sda2"))
COUNT=$(echo "${DLIB[4]}" | grep -oP '.*?(?=\%)')
LEFT=$(echo $((100-$COUNT)))

clear

if [ $COUNT -lt 50 ]
then
	echo "${bold}${white}You have used ${green}$COUNT${white} percent of your local drive space..${reset}"
	notify-send --urgency="critical" --icon="/home/$(whoami)/.voodoo.svg" "$LEFT%" "FREESPACE"
	notify-send --urgency="critical" --icon="/home/$(whoami)/.voodoo.svg" "${DLIB[4]}" "USED"

elif [ $COUNT -gt 50 ]
then
	echo "${bold}${white}You have used ${red}$COUNT${white} percent of your local drive space..${reset}"
	notify-send --urgency="critical" --icon="/home/$(whoami)/.voodoo.svg" "$LEFT%" "FREESPACE"
	notify-send --urgency="critical" --icon="/home/$(whoami)/.voodoo.svg" "${DLIB[4]}" "USED"
fi

sleep 3

clear


