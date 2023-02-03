#!/bin/bash

# Check memory usage
echo "Memory usage:"
free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }'

# Check CPU utilization
echo -e "\nCPU utilization:"
top -bn1 | awk '/Cpu\(s\):/ { printf("%.2f%%\n", $2) }'

# Check storage usage
echo -e "\nStorage usage:"
df -h | awk '$NF=="/"{printf "%s\t\t", $5}'

# Check load average
echo -e "\nLoad average:"
uptime | awk '{print $12 $13 $14}'
