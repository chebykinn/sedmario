#!/usr/bin/env bash

IFS=''
CMD=''
TMP=''

export LC_ALL="C"
(while true;
do
  read -s -n 1 -t 1 TMP
  RES=$?
  CMD="$CMD$TMP"
  if [ "$CMD" == '' ]
  then
    read -s -n 1 TMP; CMD="$CMD$TMP";
    if [ "$CMD" == '[' ]
    then
      read -s -n 1 TMP; CMD="$CMD$TMP";
    fi
  fi
  if [ $RES -eq 0 ]
  then
    echo "$CMD"
  fi

  if [ "$CMD" == "" ]
  then
    echo
  fi
  CMD=''
  TMP=''
done) | ./mario.sed
