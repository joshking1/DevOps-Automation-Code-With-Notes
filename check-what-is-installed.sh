#!/bin/bash

# Define the packages to be checked
packages=("git" "nodejs" "git-secrets" "docker" "apache2" "ansible" "openjdk-11-jdk" "terraform" "wget" "curl" "awscli" "jcli" "lamp-server^")

# Loop through the packages and check if they are installed
for package in "${packages[@]}"; do
  if ! dpkg-query -W -f='${Status}' "$package" 2>/dev/null | grep -q "ok installed"; then
    echo "$package is not installed, installing now..."
    sudo apt-get install -y "$package"

    if [ "$package" = "docker" ]; then
      sudo systemctl start docker
      sudo systemctl enable docker
    elif [ "$package" = "apache2" ]; then
      sudo systemctl start apache2
      sudo systemctl enable apache2
    elif [ "$package" = "lamp-server^" ]; then
      sudo apt-get install -y lamp-server^
      sudo systemctl start apache2
      sudo systemctl enable apache2
      sudo systemctl start mysql
      sudo systemctl enable mysql
    fi
  else
    echo "$package is already installed"
  fi
done

# Notes 
# This script uses dpkg-query to check if each package is installed, and if not, it installs the package using sudo apt-get install. 
# If the package is "docker", "apache2" or "lamp-server^", the script starts and enables the service after installation. The script outputs the status of each package, whether it is already installed or has been installed during the script's execution.