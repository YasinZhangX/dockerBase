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

STATUS=`expressvpn status`

if [[ "$STATUS" =~ "Connected to" ]];then
  echo "Connected"
elif [[ "$STATUS" =~ "Connecting" ]];then
  echo "Connecting"
elif [[ "$STATUS" =~ "Not connected" ]];then
  echo "not connected"
  echo "start connecting..."
  expressvpn connect
elif [[ "$STATUS" =~ "^Unable to connect.*" ]];then
  echo "not connected"
  echo "start connecting..."
  expressvpn connect
fi