#!/bin/bash

. $(dirname $0)/arduinoEnv.sh
screenrc=/tmp/screenrc-ard-$$

echo "hardstatus alwayslastline \"Arduino Serial Monitor on $port, $baud baud\"" > $screenrc
echo "caption always \"Press \'Ctrl-a k\' to quit\"" >> $screenrc

screen -c $screenrc $port $baud

rm $screenrc
