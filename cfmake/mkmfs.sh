#!/bin/sh
CWD=`pwd`
echo Build mfs Image
[ ! -d /mnt/loop1 ] && mkdir -p /mnt/loop1
ROOTFS=mfsimg
dd if=/dev/zero of=$ROOTFS bs=1k count=4096
losetup /dev/loop1 $ROOTFS
mkfs -t ext2 -m 0 /dev/loop1
mount /dev/loop1 /mnt/loop1
cd mfs
tar cf - . | (cd /mnt/loop1 ; tar xf - )
cd ..
umount /mnt/loop1
losetup -d /dev/loop1
echo "Gzipping the mfs file"
gzip -f $ROOTFS
