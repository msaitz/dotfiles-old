#!/bin/sh
if [ "$(bluetoothctl show | grep "Powered: yes" | wc -c)" -eq 0 ]
then
  bluetooth on
else
  bluetooth off
fi
