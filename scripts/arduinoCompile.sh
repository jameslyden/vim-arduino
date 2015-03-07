#!/bin/bash
# Build sketch, but do not deploy

echo =======================================
. $(dirname $0)/arduinoMakefile.sh
echo ""
echo Compiling sketch $sketch.
echo =======================================
echo ""

make -s -f$makefile 2>&1 | grep -vE "warning: (overriding|ignoring old) commands for target"

rm $makefile
