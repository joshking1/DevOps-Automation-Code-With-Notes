#!/bin/bash

# Add the cron job to update and upgrade the system every 10 minutes
echo "*/10 * * * * apt-get update && apt-get upgrade -y" | crontab -

# Display the current cron jobs
crontab -l

# Note Section 
# grep "^Install:" /var/log/dpkg.log | tail -1
# This command uses grep to search for the "^Install:" string in the /var/log/dpkg.log file, which logs package installations and upgrades. 
# The tail -1 command is used to display only the last line of the file, which should contain the most recent package installation or upgrade.