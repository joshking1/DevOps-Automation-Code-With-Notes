#!/bin/bash

# Check if Jenkins process is running
if pgrep -x "jenkins" > /dev/null
then
  echo "Jenkins is running"
else
  echo "Jenkins is not running"
  # Restart Jenkins process
  systemctl restart jenkins
fi

# Check for available disk space
DISK_SPACE=$(df -h /var/lib/jenkins | awk '{print $5}' | tail -1 | cut -d'%' -f1)
if [ $DISK_SPACE -gt 85 ]
then
  echo "Low disk space warning: $DISK_SPACE% used"
  # Send email notification
  echo "Subject: Low Disk Space on Jenkins Server

The disk space on the Jenkins server is running low, please take action to free up space. Current disk space usage is $DISK_SPACE%." | \
mailx -s "Low Disk Space on Jenkins Server" admin@example.com
fi

# Check for available memory
MEMORY_USAGE=$(free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }')
if [ $(echo "$MEMORY_USAGE > 85" | bc -l) -eq 1 ]
then
  echo "Low memory warning: $MEMORY_USAGE"
  # Send email notification
  echo "Subject: Low Memory on Jenkins Server

The memory on the Jenkins server is running low, please take action to free up memory. Current memory usage is $MEMORY_USAGE." | \
mailx -s "Low Memory on Jenkins Server" admin@example.com
fi

# This script checks if the Jenkins process is running, and if it is not, it restarts the process. It also checks for available disk space and memory, and sends email notifications if either disk space or memory usage exceeds a specified threshold.

# Note that this script assumes that the mailx utility is installed on the server and properly configured to send emails.