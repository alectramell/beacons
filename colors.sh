#!/bin/bash

clear

#
# IMPORTING COLORS v1.0:
# at the top of your SHELL/BASH Script, after #!/bin/bash, type..
# source <(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/colors.sh)
#
# USAGE (EXAMPLE):
# echo "${green}Hello World!${reset}"
#

clear

paper=$(tput smso)
bold=$(tput bold)
black=$(tput setaf 0)
white=$(tput setaf 7)
red=$(tput setaf 1)
green=$(tput setaf 2)
blue=$(tput setaf 6)
sky=$(tput setaf 153)
gold=$(tput setaf 3)
yellow=$(tput setaf 190)
purple=$(tput setaf 5)
reset=$(tput sgr0)

clear
