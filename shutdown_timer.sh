#!/bin/bash

echo "Enter the time to shutdown (24-hour format HH:MM):"
read shutdown_time

current_time=$(date +%H:%M)

current_minutes=$(date +%s -d "$current_time" | awk '{print int($1/60)}')
shutdown_minutes=$(date +%s -d "$shutdown_time" | awk '{print int($1/60)}')

if [ $shutdown_minutes -lt $current_minutes ]; then
  shutdown_minutes=$((shutdown_minutes + 1440))
fi

time_diff=$((shutdown_minutes - current_minutes))

echo "System will shut down at $shutdown_time, which is in $time_diff minutes."

sleep $((time_diff * 60)) && sudo shutdown -h now &
