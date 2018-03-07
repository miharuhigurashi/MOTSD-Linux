#!/bin/sh
CWD=`pwd`
cd mhsrc
tar czf www.tgz www
make || exit 1
echo "copy files to ../cfmake"
cp  mhnmd $CWD/cfmake/core/home/miharu/
cp  mhnmcgi.cgi $CWD/cfmake/core/home/miharu/
cp  mhterm    $CWD/cfmake/core/home/miharu/
cp  twsetup   $CWD/cfmake/core/usr/sbin/
cp  twntpcd   $CWD/cfmake/core/usr/sbin/
cp  uploader.cgi   $CWD/cfmake/core/usr/sbin/
cp  mhtools   $CWD/cfmake/core/usr/sbin/
cp  mhtools   $CWD/cfmake/mfs/usr/sbin/
cp  mledd   $CWD/cfmake/mfs/usr/sbin/
echo "done"
cd ..
