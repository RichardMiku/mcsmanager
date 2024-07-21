#!/bin/bash

# Change directory to /opt/mcsmanager
cd /opt/mcsmanager || { echo "Directory /opt/mcsmanager does not exist"; exit 1; }

# Check if start-daemon.sh and start-web.sh scripts exist and are executable
if [ ! -x "start-daemon.sh" ]; then
  echo "Script start-daemon.sh does not exist or is not executable"
  exit 1
fi

if [ ! -x "start-web.sh" ]; then
  echo "Script start-web.sh does not exist or is not executable"
  exit 1
fi

# Start the first screen session and run start-daemon.sh
screen -S daemon -dm bash -c "./start-daemon.sh"

# Start the second screen session and run start-web.sh
screen -S web -dm bash -c "./start-web.sh"

# Output a message indicating the sessions have been started
echo "Screen sessions 'daemon' and 'web' have been started successfully."