#!/bin/bash

lines=`cat /VPN/guard.log | wc -l`

FILE="/VPN/guard.log"
MAX_LINE=200

if [[ ! -f $FILE ]]; then
  touch $FILE
fi

if [ -a $FILE ]; then
  if [[ $lines -gt $MAX_LINE ]]; then
    echo "$FILE lines larger than $MAX_LINE"
    echo > $FILE
  fi
fi

TESTURL="www.google.com"

ping -s 1 -c 1 $TESTURL
if [[ "$?" != "0" ]];then
  echo "not connected"
  echo "start connecting..."
  expressvpn connect
else
  echo "connected"
fi
