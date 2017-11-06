#!/bin/bash

clear

source <(curl -s https://raw.githubusercontent.com/alectramell/beacons/master/echohex.sh)

clear

echohex "$1" > $(pwd)/.xname.log

xxd -p $(pwd)/.xname.log > .xname.bin

rm $(pwd)/.xname.log

mv $(pwd)/.xname.bin $(pwd)/name.bin

clear

cat $(pwd)/name.bin

