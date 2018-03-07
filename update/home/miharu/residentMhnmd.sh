#!/bin/sh
while [ -z `pidof mhnmd` ]
do
	/home/miharu/mhnmd /dev/ttySC0 /var/www/
	sleep 5
done
