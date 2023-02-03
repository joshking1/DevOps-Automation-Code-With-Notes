#!/bin/bash

# Set the path to the temporary files directory
temp_dir="/tmp" 

# Set the retention time in days
retention_time=7

# Create the command to run in cron
command="find $temp_dir -type f -mtime +$retention_time -delete"

# Add the command to the cron job list
(crontab -l 2>/dev/null; echo "0 0 * * 1 $command") | crontab -

# Confirm that the cron job was added successfully
echo "Cron job added successfully:"
crontab -l | grep "$command"
