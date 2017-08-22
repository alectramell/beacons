#!/bin/bash

clear

black=$(tput setaf 0)
white=$(tput setaf 7)
blue=$(tput setaf 6)
gold=$(tput setaf 3)
red=$(tput setaf 1)
green=$(tput setaf 2)
bold=$(tput bold)
paper=$(tput smso)
reset=$(tput sgr0)

clear

for i in $(seq 50)
do
	SSID=$(iwgetid -r)
	POWER=$(iwconfig wlp2s0 | grep -o -P ".{0,2}/70.{0,0}")
	echo "$POWER" > /home/$(whoami)/Desktop/$(iwgetid -s).log
	LOG=$(grep -o -P ".{0,2}/.{0,0}" /home/$(whoami)/Desktop/$(iwgetid -s).log | tr -s "Mb/" " ")

	if [ $LOG -eq 70 ] || [ $LOG -gt 65 ]
	then
		SIGNAL="VERY GOOD"
		echo -n "${paper}${blue}${bold} WiFi Signal for ${white} $SSID ${reset}"
		echo "${paper}${green}${bold} is (( $SIGNAL )) ${reset}"
		sleep 5.5
		clear

	elif [ $LOG -lt 65 ]
	then
		SIGNAL="GOOD"
		echo -n "${paper}${blue}${bold} WiFi Signal for ${white} $SSID ${reset}"
		echo "${paper}${green}${bold} is (( $SIGNAL )) ${reset}"
		sleep 5.5
		clear

	elif [ $LOG -lt 50 ]
	then
		SIGNAL="MEDIUM"
		echo -n "${paper}${blue}${bold} WiFi Signal for ${white} $SSID ${reset}"
		echo "${paper}${gold}${bold} is (( $SIGNAL )) ${reset}"
		sleep 5.5
		clear

	elif [ $LOG -lt 40 ]
	then
		SIGNAL="LOW"
		echo -n "${paper}${blue}${bold} WiFi Signal for ${white} $SSID ${reset}"
		echo "${paper}${red}${bold} is (( $SIGNAL )) ${reset}"
		sleep 5.5
		clear

	elif [ $LOG -lt 20 ]
	then
		SIGNAL="BAD"
		echo -n "${paper}${blue}${bold} WiFi Signal for ${white} $SSID ${reset}"
		echo "${paper}${red}${bold} is (( $SIGNAL )) ${reset}"
		sleep 5.5
		clear
	else
		clear
		echo "${paper}${red}${bold}..NO CONNECTION..${reset}"
		sleep 5.0
		clear
	fi

done
