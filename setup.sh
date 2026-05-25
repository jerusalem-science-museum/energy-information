#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "========================================="
echo " Starting Energy Information Project Setup"
echo "========================================="

# 1. Update system packages
echo -e "\n---> Updating system packages..."
sudo apt-get update && sudo apt-get upgrade -y

# 2. Install essential build tools and utilities
echo -e "\n---> Installing system utilities..."
sudo apt-get install -y curl git build-essential

# =================================================================
# UNCOMMENT THE SECTION BELOW DEPENDING ON YOUR PROJECT'S LANGUAGE
# =================================================================

### --- FOR PYTHON PROJECTS --- ###
# echo -e "\n---> Setting up Python Environment..."
# sudo apt-get install -y python3 python3-pip python3-venv
# if [ ! -d "venv" ]; then
#     python3 -m venv venv
# fi
# source venv/bin/activate
# if [ -f "requirements.txt" ]; then
#     pip install --upgrade pip
#     pip install -r requirements.txt
# else
#     echo "requirements.txt not found. Skipping pip install."
# fi

### --- FOR NODE.JS PROJECTS --- ###
# echo -e "\n---> Setting up Node.js Environment..."
# # Installs Node LTS via NodeSource
# curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
# sudo apt-get install -y nodejs
# if [ -f "package.json" ]; then
#     npm install
# else
#     echo "package.json not found. Skipping npm install."
# fi

# =================================================================

# 3. Environment Configuration Setup
echo -e "\n---> Setting up Environment Configurations..."
if [ -f ".env.example" ] && [ ! -f ".env" ]; then
    cp .env.example .env
    echo "Created .env file from template. Remember to fill in your API keys/database credentials!"
elif [ -f ".env" ]; then
    echo ".env file already exists. Skipping."
else
    echo "No .env.example found. Creating an empty .env file..."
    touch .env
fi

echo -e "\n========================================="
echo " Setup Completed Successfully! 🎉"
echo "========================================="
