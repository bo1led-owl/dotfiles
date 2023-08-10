#!/bin/bash

stdbuf -oL playerctl metadata -p spotify --format '{{ status }}{{ artist }}{{ title }}' --follow | 
while read -r line; do
  case $(playerctl status -p spotify) in
    'Playing')
      playerctl metadata -p spotify --format '{{artist}} - {{ title }}'
    ;;
    'Paused')
      echo
    ;;
    'No players found')
      echo
    ;;
  esac
done
