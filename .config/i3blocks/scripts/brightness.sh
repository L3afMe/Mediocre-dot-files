#!/bin/zsh

BRI=$(echo $(($(xbacklight) | bl -l)) | cut -d'.' -f1)

if [[ $BRI -gt 74 ]]; then
  echo "  $BRI%  "
elif [[ $BRI -gt 49 ]]; then
  echo "  $BRI%  "
elif [[ $BRI -gt 24 ]]; then
  echo "  $BRI%  "
else 
  echo "  $BRI%  "
fi
