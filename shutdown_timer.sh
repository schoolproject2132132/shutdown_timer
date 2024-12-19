#!/bin/bash

# DISCLAIMER: This script is for educational purposes only.
# Do not use it for malicious purposes. The author is not responsible
# for any unintended consequences that may result from the use of this script.

# Function to schedule shutdown
schedule_shutdown() {
    local shutdown_time=$1
    local current_time
    local current_minutes
    local shutdown_minutes
    local time_diff

    # Get the current time in 24-hour format
    current_time=$(date +%H:%M)

    # Convert both current time and shutdown time into minutes
    current_minutes=$(date +%s -d "$current_time" | awk '{print int($1/60)}')
    shutdown_minutes=$(date +%s -d "$shutdown_time" | awk '{print int($1/60)}')

    # If shutdown time is earlier than the current time, schedule for the next day
    if [ $shutdown_minutes -lt $current_minutes ]; then
        shutdown_minutes=$((shutdown_minutes + 1440))  # Add 24 hours worth of minutes
    fi

    # Calculate the difference in time
    time_diff=$((shutdown_minutes - current_minutes))

    # Notify the user
    echo "System will shut down at $shutdown_time, which is in $time_diff minutes."

    # Schedule the shutdown depending on OS
    if [[ "$OSTYPE" == "linux-gnu"* || "$OSTYPE" == "darwin"* ]]; then
        # For Linux or macOS
        sleep $((time_diff * 60)) && sudo shutdown -h now &
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" || "$OSTYPE" == "cygwin" ]]; then
        # For Windows (via Git Bash or WSL)
        sleep $((time_diff * 60)) && shutdown /s /t 0 &
    else
        echo "Unsupported OS type: $OSTYPE"
        exit 1
    fi
}

# Main script
echo "Enter the time to shutdown (24-hour format HH:MM):"
read shutdown_time

# Call the shutdown scheduling function
schedule_shutdown "$shutdown_time"
