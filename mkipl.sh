#!/bin/sh
CWD=`pwd`
echo Build IPL
cd ipl
make
cp sh-stub.bin ../rel/ipl.bin
cp sh-stub.exe ../rel/ipl.elf
cd $CWD

echo Done
