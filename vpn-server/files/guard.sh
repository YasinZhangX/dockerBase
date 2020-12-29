#!/bin/sh

STATUS=`expressvpn status`

if [[ "$STATUS" =~ "Connected to" ]];then
  echo "Connected"
elif [[ "$STATUS" =~ "Connecting" ]];then
  echo "Connecting"
elif [[ "$STATUS" =~ "Not connected" ]];then
  echo "not connected"
  echo "start connecting..."
  expressvpn connect
fi