#!/bin/bash

# Get system information
echo "System Information:"
echo "CPU utilization: $(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%"
echo "Memory utilization: $(free -m | awk '/Mem:/ {printf("%.2f%"), $3/$2*100}')"
echo "Disk utilization: $(df -h | awk '/\/$/ {print $5}')"

# Get information about the application's process
pid=$(pgrep <application_name>)
echo "Application Information:"
echo "CPU utilization: $(top -bn1 -p $pid | awk 'NR==3 {print $9}')%"
echo "Memory utilization: $(top -bn1 -p $pid | awk 'NR==3 {print $10}')%"