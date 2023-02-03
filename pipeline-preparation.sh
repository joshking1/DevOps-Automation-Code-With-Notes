#!/bin/bash

# 1. create a user called jenkins
useradd jenkins

# 2. give the jenkins user created the password: josh@345@3#$%
echo "jenkins:josh@345@3#$%" | chpasswd

# 3. the created password should expires after 3 months and user should be forced to create a new one
chage -M 90 jenkins

# 4. install docker
apt-get update && apt-get install docker.io -y

# 5. add the user jenkins to docker group
usermod -aG docker jenkins

# 6. add the user jenkins to the sudoers file
echo "jenkins   ALL=(ALL)  NOPASSWD:  ALL" >> /etc/sudoers

# 7. switch to jenkins user using su - jenkins
su - jenkins


# Note Section [Note: This script assumes that you have the necessary permissions to run the commands and that the appropriate repositories 
# are enabled on your server.
# to check the password parameters of the user jenkins
# run the command # chage -l jenkins ] 