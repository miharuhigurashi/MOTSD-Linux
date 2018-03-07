#!/bin/sh
#
# Build  kernel
CWD=`pwd`
echo Build Kernel
cd kernel
make zImage || exit
cp arch/sh/boot/zImage $CWD/rel/
cp arch/sh/boot/zImage $CWD/kernel/
cd $CWD
echo Build Driver

cd  driver/ADIN
make
cd $CWD

cd  driver/DIPSW
make
cd $CWD

cd  driver/GPIO
make
cd $CWD

cd  driver/LAN
make
cd $CWD


echo Done
