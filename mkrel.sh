#!/bin/sh
CWD=`pwd`
echo Copy Kernel and Drivers
cp $CWD/kernel/zImage rel/
cd cfmake
cp $CWD/kernel/zImage backup/
cp $CWD/driver/ADIN/*.o core/lib/modules/
cp $CWD/driver/DIPSW/*.o core/lib/modules/
cp $CWD/driver/GPIO/*.o core/lib/modules/
cp $CWD/driver/LAN/*.o core/lib/modules/
cp $CWD/driver/LAN/*.o mfs/lib/modules/
cp $CWD/driver/DIPSW/*.o mfs/lib/modules/
cp $CWD/driver/GPIO/*.o mfs/lib/modules/

echo Build WWW Data
cd core
tar xzf ../bbox.tgz
cd home
tar xzf ../../../mhsrc/www.tgz
cd ..
tar czf ../coreimg.tgz .
cd ..
cd mfs
tar xzf ../bbox.tgz
cd ..

echo Build mfs Image
./mkmfs.sh
cp mfsimg.gz ../rel/mfsimg.bin
cp mfsimg.gz backup/mfsimg.bin

echo Build Root Image
#Make JFFS2 Root Image 8MB
mkfs.jffs2 -r core -e 0x20000 --pad=0x0800000 -o coreimg.bin
cp coreimg.bin ../rel/
rm coreimg.bin.gz
gzip  coreimg.bin
cp coreimg.bin.gz ../rel/
cp coreimg.bin.gz backup/

#Make JFFS2 BackUP Image 15MB
echo Build Backup Image
cp ../rel/zImage backup/
mkfs.jffs2 -r backup -e 0x20000 --pad=0x0f00000 -o backupimg.bin
cp backupimg.bin ../rel/
rm backupimg.bin.gz
gzip  backupimg.bin
cp backupimg.bin.gz ../rel/
cd $CWD

echo Build IPL
cd ipl
make
cp sh-stub.bin ../rel/ipl.bin
cp sh-stub.exe ../rel/ipl.elf
cd $CWD

echo Done
