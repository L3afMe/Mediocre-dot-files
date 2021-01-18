#!/bin/bash

#!/bin/bash

LO="  "
HI="  "
MO="  "
MU="  "

VOL=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
VO=$(echo "$VOL" | cut -d'%' -f1)

get_vol_icon() {
  if [[ $VO -gt 65 ]]; then
    echo "$HI$VOL "
  elif [[ $VO -gt 32 ]]; then
    echo "$MO$VOL "
  else 
    if [[ $VOL -gt 9 ]]; then 
      echo "$LO$VOL "
    else
      echo "$LO$VOL "
    fi
  fi  
}

if [[ $(amixer get Master | grep '\[on\]') ]]; then
  get_vol_icon
else
  echo "$MU$VOL "
fi
