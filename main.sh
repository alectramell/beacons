#!/bin/bash

clear

RELOAD() {

	clear
	wget https://raw.githubusercontent.com/alectramell/beacons/master/status.txt -O $(pwd)/status.txt
	clear
	echo "OFF" > $(pwd)/status.txt
	sleep 0.5
	clear
	echo "ON" > $(pwd)/status.txt
	sleep 0.5
	clear
	echo "..ATTEMPTING TO RE-GATHER BEACONS.." | pv -qL 10
	sleep 5
	clear
	rm $(pwd)/red.bcn
	rm $(pwd)/yellow.bcn
	rm $(pwd)/green.bcn
	clear
	rm $(pwd)/status.txt
	clear
	bash $(pwd)/main.sh
}

clear

if [ $(date +%S) -lt 5 ]
then
	RELOAD
else
	clear
fi

clear

TAG=$((1 + RANDOM % 3))
blue=$(tput setaf 4)
red=$(tput setaf 1)
back=$(tput smso)
yellow=$(tput setaf 190)
green=$(tput setaf 2)
reset=$(tput sgr0)

clear

while [ $(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/status.txt) = "ON" ]
do

if [ $(date +%S) -lt 5 ]
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
	cat $(pwd)/red.bcn > /home/$(whoami)/Desktop/.red.bcns

	clear

	echo "BEACONS (${red}$POP${reset})" | pv -qL 15
	sleep 1.5
	showBeacons=$(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/red.bcn)
	echo "${back}${blue}LIST >>${reset}"
	echo "${red}$showBeacons${reset}"
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
	cat $(pwd)/red.bcn > /home/$(whoami)/Desktop/.yellow.bcns

	clear

	echo "BEACONS (${yellow}$POP${reset})" | pv -qL 15
	sleep 1.5
	showBeacons=$(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/yellow.bcn)
	echo "${back}${blue}LIST >>${reset}"
	echo "${yellow}$showBeacons${reset}"
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
	cat $(pwd)/red.bcn > /home/$(whoami)/Desktop/.green.bcns

	clear

	echo "BEACONS (${green}$POP${reset})" | pv -qL 15
	sleep 1.5
	showBeacons=$(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/green.bcn)
	echo "${back}${blue}LIST >>${reset}"
	echo "${green}$showBeacons${reset}"
	sleep 5
fi

if [ -e /home/$(whoami)/Desktop/.red.bcns ] && [ -e /home/$(whoami)/Desktop/.yellow.bcns ] && [ -e /home/$(whoami)/Desktop/.green.bcns ]
then
	RBCNS=$(cat /home/$(whoami)/Desktop/.red.bcns)
	YBCNS=$(cat /home/$(whoami)/Desktop/.yellow.bcns)
	GBCNS=$(cat /home/$(whoami)/Desktop/.green.bcns)

	clear

	echo "[red]" > /home/$(whoami)/Desktop/beacons.list
	echo "$RBCNS" >> /home/$(whoami)/Desktop/beacons.list
	echo -e "\n" >> /home/$(whoami)/Desktop/beacons.list
	echo "[yellow]" >> /home/$(whoami)/Desktop/beacons.list
	echo "$YBCNS" >> /home/$(whoami)/Desktop/beacons.list
	echo -e "\n" >> /home/$(whoami)/Desktop/beacons.list
	echo "[green]" >> /home/$(whoami)/Desktop/beacons.list
	echo "$GBCNS" >> /home/$(whoami)/Desktop/beacons.list
	echo -e "\n" >> /home/$(whoami)/Desktop/beacons.list
	
	clear
else
	clear
fi

if [ -e /home/$(whoami)/Desktop/beacons.list ]
then
	echo "..LOADING BEACON LIST.." | pv -qL 10
	sleep 3
	clear
	gnome-open /home/$(whoami)/Desktop/beacons.list &
	sleep 1.5
	clear
	rm /home/$(whoami)/Desktop/.red.bcns
	rm /home/$(whoami)/Desktop/.yellow.bcns
	rm /home/$(whoami)/Desktop/.green.bcns
	clear
	rm $(pwd)/red.bcn
	rm $(pwd)/yellow.bcn
	rm $(pwd)/green.bcn
	clear
	rm $(pwd)/status.txt
	exit
else
	clear
fi

done

