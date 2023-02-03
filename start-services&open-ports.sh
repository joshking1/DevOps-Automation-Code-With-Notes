#!/bin/bash

# Save the script to a file, for example install-services.sh
# Make the file executable with the following command:
# chmod +x install-services.sh

# Install Apache
sudo apt-get update
sudo apt-get install apache2 -y

# Open port 80 for Apache
sudo ufw allow 80/tcp

# Install Docker
sudo apt-get install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

# Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y

# Open port 8080 for Jenkins
sudo ufw allow 8080/tcp

# Start the services of Apache, Docker, and Jenkins
sudo systemctl start apache2
sudo systemctl start jenkins

# Send email notification
mail -s "Services installed successfully" josh.kidfileapp@gmail.com <<< "Apache, Docker, and Jenkins have been installed and started successfully on your server. Please check the services are running properly."

# Notes
# This script will install Apache, Docker, and Jenkins on an Ubuntu server, open ports 80 and 8080, start the services, and send an email notification to josh.kidfileapp@gmail.com. 
# The email will have a subject of "Services installed successfully" and a message indicating that the services have been installed and started. 
# Note that this script assumes that a mail server is already configured and working on the system.