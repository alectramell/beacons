#!/bin/bash

clear

#
# USAGE (EXAMPLE):
#
# bash <(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/helloworld.sh)
#

clear

source <(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/colors.sh)

clear

echo "${paper}${blue}Hello World!${reset}"

sleep 2.5
