#!/bin/bash

# Define the file where the inventory will be stored
inventory_file="inventory.txt"

# Create the file and write the header
echo "Linux Server Inventory" > $inventory_file
echo "Date: $(date)" >> $inventory_file
echo "Hostname: $(hostname)" >> $inventory_file
echo "" >> $inventory_file

# System Information
echo "System Information" >> $inventory_file
echo "Operating System: $(lsb_release -d | awk -F':' '{print $2}')" >> $inventory_file
echo "Kernel Version: $(uname -r)" >> $inventory_file
echo "" >> $inventory_file

# Hardware Information
echo "Hardware Information" >> $inventory_file
echo "Processor: $(grep 'model name' /proc/cpuinfo | head -1 | awk -F':' '{print $2}')" >> $inventory_file
echo "Memory: $(grep 'MemTotal' /proc/meminfo | awk -F':' '{print $2}')" >> $inventory_file
echo "Storage:" >> $inventory_file
df -h | grep -v tmpfs >> $inventory_file
echo "" >> $inventory_file

# Network Information
echo "Network Information" >> $inventory_file
echo "IP Addresses:" >> $inventory_file
ip addr show | grep 'inet ' | awk '{print $2}' >> $inventory_file
echo "Routes:" >> $inventory_file
route -n >> $inventory_file
echo "" >> $inventory_file

# Package Information
echo "Package Information" >> $inventory_file
dpkg-query -f='${binary:Package} ${Version}\n' -W >> $inventory_file
echo "" >> $inventory_file

# Service Information
echo "Service Information" >> $inventory_file
systemctl list-units --type=service --all | awk '{print $1}' >> $inventory_file
echo "" >> $inventory_file

# User Information
echo "User Information" >> $inventory_file
echo "User Accounts:" >> $inventory_file
cat /etc/passwd | awk -F: '{print $1}' >> $inventory_file
echo "Sudoers:" >> $inventory_file
cat /etc/sudoers | grep -v '^#' >> $inventory_file
echo "" >> $inventory_file

# Firewall Information
echo "Firewall Information" >> $inventory_file
echo "Firewall Status: $(systemctl is-active firewalld)" >> $inventory_file
echo "Firewall Rules:" >> $inventory_file
#firewall-cmd --list-all >> $inventory_file
