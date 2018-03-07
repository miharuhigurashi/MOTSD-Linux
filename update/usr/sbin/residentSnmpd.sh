#!/bin/sh
while [ -z `pidof snmpd` ]
do
	/usr/sbin/snmpd -c /etc/snmpd.conf
	sleep 5
done
