#!/bin/bash

# Folder where files to securely delete are located
FOLDER="$HOME/secure delete"

# Check if the folder exists
if [ ! -d "$FOLDER" ]; then
    echo "Folder '$FOLDER' not found."
    exit 1
fi

# Confirm with the user
read -p "Confirm deletion in '$FOLDER'? (y/n): " confirm
if [[ "$confirm" != "y" ]]; then
    echo "Aborted."
    exit 1
fi

# Check if the folder is empty
if [ -z "$(ls -A "$FOLDER")" ]; then
    echo "The folder is empty. "
    exit 0
fi

# Securely delete all files inside the folder
echo "Securely deleting all files in '$FOLDER'..."
srm -v -r "${FOLDER}/"*

echo "Operation completed"
