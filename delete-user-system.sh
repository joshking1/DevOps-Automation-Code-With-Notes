#!/bin/bash

# Define the user to delete
user="username"

# Check if the user exists
if id "$user" >/dev/null 2>&1; then
  # Disable the user's password
  passwd -l "$user"

  # Delete the user account
  userdel "$user"

  # Remove the user's home directory
  rm -rf "/home/$user"

  # Print a success message
  echo "User $user has been deleted successfully."
else
  # Print an error message if the user doesn't exist
  echo "Error: User $user does not exist."
fi
