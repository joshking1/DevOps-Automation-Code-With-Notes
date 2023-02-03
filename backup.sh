#!/bin/bash

# Define the backup directory
backup_dir="/root"

# Define the source directory
source_dir="/tmp"

# Get the current date
current_date=$(date +%Y-%m-%d)

# Create the backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
  mkdir -p "$backup_dir"
fi

# Compress the source directory into a tar archive
tar czf "$backup_dir/backup-$current_date.tar.gz" "$source_dir"

# Print a success message
echo "Backup created successfully: $backup_dir/backup-$current_date.tar.gz"
