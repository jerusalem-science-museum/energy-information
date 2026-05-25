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
