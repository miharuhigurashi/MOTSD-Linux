#!/bin/sh
# check resident 'mhnmd'. return pid
echo `ps | grep mhnmd |grep -v grep | sed -e 's/ \+/ /g' | sed -e 's/^ //' | cut -d ' ' -f 1`
