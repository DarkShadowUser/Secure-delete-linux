#!/bin/bash

# Define Trash paths
TRASH_FILES="$HOME/.local/share/Trash/files"
TRASH_INFO="$HOME/.local/share/Trash/info"

# Check if Trash directories exist
if [ ! -d "$TRASH_FILES" ] || [ ! -d "$TRASH_INFO" ]; then
    echo "Error finding trash directory"
    exit 1
fi

# Check if Trash is empty
if [ -z "$(ls -A "$TRASH_FILES")" ] && [ -z "$(ls -A "$TRASH_INFO")" ]; then
    echo "Trash is already empty."
    exit 0
fi

# Confirm with the user
read -p "Confirm deletion (y/n): " confirm
if [[ "$confirm" != "y" ]]; then
    echo "Aborted."
    exit 1
fi

# Securely delete trashed files and info
echo "Deleting files..."
srm -v -r "${TRASH_FILES}/"*

echo "Securely deleting trash info..."
srm -v -r "${TRASH_INFO}/"*

echo "Completed operation"
