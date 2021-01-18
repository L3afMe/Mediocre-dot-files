#!/bin/bash

SSID=$(iwgetid -r)
SSIG=$(grep $(iwgetid -m | awk '{ printf "%s", $1 }') /proc/net/wireless | awk '{ printf "%i\n", int($3 * 100 / 70) }')

SIG=$(echo "$SSIG" | rev | cut -c 2- | rev)

get_bat() {
  case $SIG in
    0 | 1)  echo "  $SSID " ;;
    2 | 3)  echo "  $SSID " ;;      
    4 | 5)   echo "  $SSID " ;;
    6 | 7)   echo "  $SSID " ;;
    *)    echo "  $SSID "
  esac
}

if [[ $SSID ]]; then
  get_bat
else
  echo "   "
fi

