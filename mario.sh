#!/bin/bash
IFS=''
CMD=''
TMP=''
START=0
clear
echo "press q to exit"
export LC_ALL="C"
(while true; do
	if [ $START -eq 0 ]; then
		START=1
		echo
		continue
	fi
	read -s -n 1 -t 1 TMP
	RES=$?
	CMD="$CMD$TMP"
	if [ "$CMD" == '' ]; then
		read -s -n 1 TMP; CMD="$CMD$TMP";
		if [ "$CMD" == '[' ]; then
			read -s -n 1 TMP; CMD="$CMD$TMP";
		fi
	fi
	if [ $RES -eq 0 ]; then
		echo "$CMD"
	fi
	if [ "$CMD" == "" ]; then
		echo
	fi
	CMD=''
	TMP=''
done) | ./mario.sed
