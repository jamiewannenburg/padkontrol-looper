#!/bin/bash

# Configuration
PI_USER="patch"
PI_HOST="raspberrypi.local"  # Change this to your Pi's hostname or IP
REMOTE_DIR="/home/patchbox/modules/padkontrol-looper"
LOCAL_DIR="."

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting sync with Raspberry Pi...${NC}"

# Check if rsync is installed
if ! command -v rsync &> /dev/null; then
    echo -e "${RED}rsync is not installed. Please install it first.${NC}"
    exit 1
fi

# Sync files to Raspberry Pi
rsync -avz --delete \
    --exclude '.git' \
    --exclude 'node_modules' \
    --exclude '*.sh' \
    --exclude 'dev.sh' \
    "$LOCAL_DIR/" \
    "$PI_USER@$PI_HOST:$REMOTE_DIR/"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Sync completed successfully!${NC}"
    
    # Restart patchbox service on the Pi
    echo -e "${GREEN}Restarting patchbox service...${NC}"
    ssh "$PI_USER@$PI_HOST" "sudo systemctl restart patchbox"
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Patchbox service restarted successfully!${NC}"
    else
        echo -e "${RED}Failed to restart patchbox service${NC}"
    fi
else
    echo -e "${RED}Sync failed!${NC}"
    exit 1
fi 