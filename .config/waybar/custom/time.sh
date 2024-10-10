#!/bin/bash

date +"%H:%M"
sleep $((60 - $(date +%S)))s

while :
do
  date +"%H:%M"
	sleep 60
done
