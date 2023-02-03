#!/bin/bash

# Check if the application-running folder exists
if [ ! -d ~/application-running ]; then
  mkdir ~/application-running
fi

# Loop through all running processes
for process in $(ps -eo comm); do
  echo "Checking process: $process"
  # Get CPU utilization for the process
  cpu_util=$(top -b -n1 | grep "$process" | awk '{print $9}')
  echo "CPU utilization: $cpu_util%"

  # Get memory utilization for the process
  mem_util=$(top -b -n1 | grep "$process" | awk '{print $10}')
  echo "Memory utilization: $mem_util%"

  # Get storage utilization for the process
  storage_util=$(du -h $(pgrep "$process") | awk '{print $1}')
  echo "Storage utilization: $storage_util"

  # Check if the process is running okay
  if ps -p $(pgrep "$process") > /dev/null; then
    echo "$process is running okay"
  else
    echo "$process is not running okay"
  fi
  echo ""

  # Save the output to the application-running directory
  echo "CPU utilization: $cpu_util%" >> ~/application-running/"$process".txt
  echo "Memory utilization: $mem_util%" >> ~/application-running/"$process".txt
  echo "Storage utilization: $storage_util" >> ~/application-running/"$process".txt
  if ps -p $(pgrep "$process") > /dev/null; then
    echo "$process is running okay" >> ~/application-running/"$process".txt
  else
    echo "$process is not running okay" >> ~/application-running/"$process".txt
  fi
done

# Notes 
# This script uses the ps and top commands to retrieve information about running processes and their utilization of CPU, memory, and storage. 
# The output is saved to text files in the application-running directory in the home directory of the current user.