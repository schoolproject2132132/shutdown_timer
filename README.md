# Shutdown Timer Script

## DISCLAIMER

This script is for **educational purposes only**. It allows the user to input a specific time to shut down the computer.

**Do not use this script for malicious purposes**. The author is **not responsible** for any unintended consequences, data loss, or damages that may occur as a result of using this script. 

It is the user's responsibility to use the script ethically and safely.

## Features

- Input a specific time (in 24-hour format) for the computer to shut down.
- If the provided time is in the past, it will schedule the shutdown for the next day.
- The script automatically calculates the time difference and sets a timer to shut down the system.

## Usage

1. Make the script executable:
    ```bash
    chmod +x shutdown_timer.sh
    ```

2. Run the script:
    ```bash
    ./shutdown_timer.sh
    ```

3. Enter the time (in 24-hour format) when prompted, and the system will shut down at that time.

## Important Notes

- **Use responsibly**: Only run the script on your own systems or in a controlled environment.
- The script works with Linux-based systems and uses `shutdown` command to power off the system.
