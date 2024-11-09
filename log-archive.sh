#!/bin/bash

# Directory to store archived logs
ARCHIVE_DIR="archive-logs"

# Function to set up a cron job
setup_cron() {
    # Check if cron job already exists
    CRON_JOB="0 0 * * * $(pwd)/log-archive.sh /var/log"
    (crontab -l | grep -F "$CRON_JOB") && echo "Cron job already exists." && exit 0

    # Add the cron job
    (crontab -l; echo "$CRON_JOB") | crontab -
    echo "Cron job added to run at midnight every day."
    exit 0
}

# Check for --setup-cron argument
if [ "$1" == "--setup-cron" ]; then
    setup_cron
fi

# Check if a log directory was provided
if [ -z "$1" ]; then
    echo "Error: No log directory provided."
    echo "Usage: $0 <log-directory>"
    exit 1
fi

# Ensure the provided directory exists
if [ ! -d "$1" ]; then
    echo "Error: Directory '$1' does not exist."
    exit 1
fi

# Create the archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Get the current date and time for the archive file name
DATE=$(date +%Y%m%d_%H%M%S)
ARCHIVE_FILE="$ARCHIVE_DIR/logs_archive_${DATE}.tar.gz"

# Archive the logs and log the action
tar -czf "$ARCHIVE_FILE" "$1" && echo "[$(date '+%Y-%m-%d %H:%M:%S')] Archived $1 to $ARCHIVE_FILE" >> "$ARCHIVE_DIR/archive_log.txt"

