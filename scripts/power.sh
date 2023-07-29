#!/bin/bash

if [[ $1 == "set" ]]; then
  if [[ $2 == "performance" ]]; then
      cpupower frequency-set -g performance
    else if [[ $2 == "powersave" ]]; then
      cpupower frequency-set -g powersave
    else
      echo "Wrong option choosed. Available ones are: performance, powersave."
    fi
  fi
  else if [[ $1 == "get" ]]; then
    cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
  else if [[ $1 == "help" ]]; then
    echo "Power management script"
    echo
    echo "Available commands:"
    echo "set [performance/powersave] - set current governor (needs root privileges)"
    echo "get - get current governor"
    echo "help - print this help message"
  else
    echo "Unknown command. Try 'help' for more information"
  fi
  fi
fi
