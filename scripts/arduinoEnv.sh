#!/bin/bash
# Set up environment variables used by other scripts or master makefile

# Used to build include path for libraries
ARDUINO_SKETCHBOOK=~/Desktop/code/arduino

# Used to find toolchain
ARDUINO_DIR=/usr/share/arduino
ARDMK_DIR=/usr
AVR_TOOLS_DIR=/usr
PATH=$PATH:$ARDUINO_DIR:$ARDMK_DIR:$AVR_TOOLS_DIR

# Extract some parameters from Arduino IDE's configuration and sketch file
sketch=$1
board=$(grep ^board 					~/.arduino/preferences.txt | cut -d= -f2)
port=$(grep ^serial\.port 			~/.arduino/preferences.txt | cut -d= -f2)
#baud=$(grep ^serial\.debug_rate 	~/.arduino/preferences.txt | cut -d= -f2)
baud=$(grep Serial.begin $sketch/*.ino | head -1 | cut -d\( -f2 | cut -d\) -f1)

# Enter working directory
cd $sketch
