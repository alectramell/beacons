#!/bin/bash

echohex() {

	echo -n "$1" | xxd -p
}
