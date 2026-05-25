#!/bin/bash

# URL to open in kiosk mode
URL="https://www.madaorgil.website/"

# Check if Firefox is installed
if ! command -v firefox &> /dev/null; then
    echo "Firefox is not installed. Please install it first."
    exit 1
fi

# Enable touch mode by setting Firefox environment variables
export MOZ_USE_XINPUT2=1

# Open Firefox in kiosk mode with the specified URL
firefox --kiosk "$URL"
