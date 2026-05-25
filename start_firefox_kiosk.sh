#!/bin/bash

# URL to open in kiosk mode
URL="https://www.madaorgil.website/"

# Check if Firefox is installed
if ! command -v firefox &> /dev/null; then
    echo "Firefox is not installed. Please install it first."
    exit 1
fi

# --- NEW: Wait for active internet connection ---
echo "Waiting for network connection..."
while ! ping -c 1 -W 1 8.8.8.8 &>/dev/null; do
    sleep 1
done
echo "Network is up! Launching Firefox..."
# ------------------------------------------------

# Enable touch mode by setting Firefox environment variables
export MOZ_USE_XINPUT2=1

# Open Firefox in kiosk mode with the specified URL
firefox --kiosk "$URL"
