#!/bin/bash

clear

source <(curl -s https://raw.githubusercontent.com/alectramell/shlib/master/colors.sh)

clear

CHECKPKG=$(sudo apt-cache search "$1" | grep -o -c "$1")

clear

if [ $CHECKPKG -eq 1 ] || [ $CHECKPKG -gt 1 ]
then
	echo -n "${bold}${gold}$1${reset} is "
	echo -n "${bold}${green}AVAILABLE${reset}"
	echo " for ${bold}${blue}apt-get${reset} install"
	read -s -n1
	clear
else
	echo -n "${bold}${gold}$1${reset} is "
	echo -n "${bold}${red}NOT AVAILABLE${reset}"
	echo " for ${bold}${blue}apt-get${reset} install"
	read -s -n1
	clear
fi

clear

