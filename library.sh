#!/bin/bash

clear

XLIB=($(cat $(pwd)/library.txt))

clear

echo "${XLIB[0]}"
echo "${XLIB[1]}"
echo "${XLIB[2]}"

read -s -n1

clear 
