#!/bin/sh
echo change mhmain...
HOSTNAME=`cat /etc/hostname`
ADDRESS=`cut -f 1 -d ' ' /etc/ipsetup`
sed "s/^<TITLE>mhmain<\/TITLE>$/<title>$HOSTNAME($ADDRESS)<\/title>/" /home/www/index.html > /var/www/index.html

rm /var/www/mhmain.html
cp /home/www/mhmain.html /var/www/mhmain.html
echo change f-info...
#HOSTNAME=`cat /etc/hostname`
#ADDRESS=`cut -f 1 -d ' ' /etc/ipsetup`
sed "s/^<title>f_info<\/title>$/<title>$HOSTNAME($ADDRESS)<\/title>/" /home/www/mhmain.html > /var/www/mhmain.html

