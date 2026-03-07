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

# 1. Create a directory named data
mkdir data
# 2. Move the •/rawdata directory to ./data/raw
mv rawdata data/raw
# 3. List the contents of the /data/raw directory
ls data/raw
# 4. Create processed directories and subdirectories
mkdir -p data/processed/server_logs
mkdir -p data/processed/user_logs
mkdir -p data/processed/event_logs
# 5. Copy all server log files
find data/raw -type f -name "*server*. log" -exec cp () data/processed/server_logs/ \;
# 6. Copy user logs and event Logs
find data/raw -type f -name "*user*.log" -exec cp () data/processed/user_logs/ \;
find data/raw type f -name "*event*.log" -exec cp ()) data/processed/event_logs/ \;
# 7. Remove all files containing
find data/raw -type f -name "*ipaddr*" -delete 
find data/processed/user_logs -type f -name "*ipaddr" -delete
# 8. Create inventory file listing all files in processed folders
find data/processed -type f > data/inventory.txt
###########################################

echo "Project setup is complete!"
