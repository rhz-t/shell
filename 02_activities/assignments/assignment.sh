#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

if [ -d newproject ]; then
  echo "Recreating the newproject directory"
  rm -rf newproject
fi
mkdir newproject
cd newproject

mkdir analysis output
touch README.md
echo "# Project Name: DSI Consulting Inc." > README.md
touch analysis/main.py

# download client data
curl -Lo rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip -q rawdata.zip

###########################################
# Complete assignment here


mkdir data

mv rawdata data/raw

ls data/raw

mkdir -p data/processed/server_logs
mkdir -p data/processed/user_logs
mkdir -p data/processed/event_logs

<<<<<<< HEAD
cp data/raw/*server*.log data/processed/server_logs/
cp data/raw/*user*.log data/processed/user_logs/
cp data/raw/*event*.log data/processed/event_logs/
=======
# 6. Repeat the above step for user logs and event logs

# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
rf -rf ./data

# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed
>>>>>>> ea20676d33161a6f4d0fcd3c4f7aa5360f0f4309

rm data/raw/*ipaddr*
rm data/processed/user_logs/*ipaddr*

find data/processed -type f > data/inventory.txt

###########################################

echo "Project setup is complete!"
