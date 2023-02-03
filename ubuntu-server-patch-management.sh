#!/bin/bash

# Update the package index
sudo apt-get update

# Upgrade all installed packages to the latest version
sudo apt-get upgrade -y

# Install security updates without prompting for confirmation
sudo apt-get install -y --only-upgrade security

# Remove old packages that are no longer needed
sudo apt-get autoremove -y

# Clean up the local package cache to save disk space
sudo apt-get clean

# Notes 
# This script updates the package index, upgrades all installed packages to the latest version, installs security updates, removes old packages, and cleans up the local package cache. 
# It's a simple and effective way to keep your Linux server up to date with the latest security patches and package updates.