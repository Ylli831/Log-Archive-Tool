# Log Archive Tool

This project provides a command-line tool for archiving system logs. The tool allows users to compress logs into .tar.gz files and store them in a specified directory. This is useful for cleaning up old logs while maintaining them in a compressed format for future reference. Additionally, the tool can automatically schedule the log archiving process via cron jobs.

## Project URL

https://roadmap.sh/projects/log-archive-tool

## Features

- **Manual Log Archiving**: Compress logs from a specified directory and store them in an archive.
- **Automatic Scheduling**: Set up a cron job to automatically archive logs at a specified time (e.g., daily at midnight).
- **Log Tracking**: Archive activities are logged with timestamps for easy reference.
- **Supports tar.gz Format**: Archives logs in .tar.gz format to save disk space.

## Prerequisites

- This tool is intended to be run on a Linux system with bash installed.
- The \`tar\` utility must be available on the system.

## Instructions to Run the Project

### 1. Clone the Repository
Clone the repository to your machine:
\`\`\`bash
git clone https://github.com/Ylli831/Log-Archive-Tool.git
cd Log-Archive-Tool
\`\`\`

### 2. Make the Script Executable
Ensure the script is executable by running:
\`\`\`bash
chmod +x log-archive.sh
\`\`\`

### 3. Running the Script Manually
You can manually archive the logs by providing the log directory as an argument:
\`\`\`bash
./log-archive.sh /var/log
\`\`\`
This will compress the logs from the /var/log directory and store the archive in a directory called archive-logs.

### 4. Setting Up a Cron Job for Automatic Archiving
To automatically archive the logs every day at midnight, run the following command:
\`\`\`bash
./log-archive.sh --setup-cron
\`\`\`
This will add a cron job that runs the log archiving process daily at midnight.

### 5. Log File
The script will log all archive operations in the archive-logs/archive_log.txt file with timestamps and file locations.

## Customizing the Script

- **Change the Archive Directory**: You can modify the \`ARCHIVE_DIR\` variable to specify a different directory for storing the compressed logs.
- **Schedule the Cron Job**: To change the scheduling of the cron job, edit the cron job in the crontab by running \`crontab -e\` and modifying the schedule.
