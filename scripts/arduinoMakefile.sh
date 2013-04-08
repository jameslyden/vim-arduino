#!/bin/bash

. $(dirname $0)/arduinoEnv.sh
makefile=ard-mk-$$
userlibroot=$(echo "$ARDUINO_DIR/libraries" | grep -o "/" | sed '{:q;N;s/\n//g;t q}' | sed 's;/;../;g')/$ARDUINO_SKETCHBOOK/libraries

for lib in $(grep "^#include <" $sketch/*.ino | cut -d"<" -f2 | cut -d. -f1); do
	if [ -d $ARDUINO_DIR/libraries/$lib ]; then
		libs="$libs $lib"
		if [ -d $ARDUINO_DIR/libraries/$lib/utility ]; then
			libs="$libs $lib/utility"
		fi
	elif [-d $ARDUINO_SKETCHBOOK/libraries/$lib ]; then
		libs="$libs /$userlibroot/$lib"
	else
		echo "Library $lib not found. Program may not compile properly."
	fi
done

echo "BOARD_TAG    = $board" > $makefile
echo "ARDUINO_PORT = $port" >> $makefile
echo "ARDUINO_LIBS =$libs" >> $makefile
echo "ARDUINO_DIR = $ARDUINO_DIR" >> $makefile
echo "include $ARDUINO_DIR/Arduino.mk" >> $makefile

echo "Using the following makefile contents:"
cat $makefile
