#!/bin/bash

# 1. Add user ronnie
useradd ronnie

# 2. Assign user ronnie a password called josh1234
echo "josh1234" | passwd --stdin ronnie

# 3. Password created for user ronnie should expire after 90 days
chage -M 90 ronnie

# 4. Ubuntu server should send an email notification automatically to user ronnie
# using the email josh.kidfileapp@gmail.com to remind about password expiring 15 days before expiration date
echo "Subject:Password Expiration Warning

Your password will expire in 15 days. Please change it to avoid any inconvenience." | \
mailx -s "Password Expiration Warning" josh.kidfileapp@gmail.com

# 5. Add user ronnie to wheel group
usermod -aG docker ronnie

# 6. Create a group called devops-engineers
groupadd devops-engineers

# 7. Add user ronnie to devops-engineers group
usermod -aG devops-engineers ronnie

# 8. Assign admin permission to devops-engineers group
echo "%devops-engineers ALL=(ALL) ALL" >> /etc/sudoers

# Note Section 
# Note: This script assumes that the mailx utility is installed on the server and properly configured to send emails.