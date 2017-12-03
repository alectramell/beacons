#!/bin/bash

# ABOUT:
# Convert ASCII String to Hexidecimal Characters with Terminal commandline.
# USAGE:
# Open Terminal Window and run..
#
# bash <(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/echohex.sh) "STRING-TO-CONVERT"
#
# If you would prefer, you can add echohex to your .bashrc file, as follows..
#
# Open Terminal Window and type..
#
# gedit ~/.bashrc
#
# Add the following line(s) to .bashrc
#
# echohex() {
#
# bash <(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/echohex.sh) $1
#
# }


echohex() {

	echo -n "$1" | xxd -p
}
