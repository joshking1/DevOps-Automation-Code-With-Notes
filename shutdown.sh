#!/bin/bash

echo "Reboot initiated."

# Schedule reboot for 2 minutes from now
shutdown -r +2 "Server reboot in progress. The server will restart in 2 minutes."

echo "Server reboot scheduled."
