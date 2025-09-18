#!/bin/bash

# Simple batch renaming script
# Usage: ./rename.sh <directory> <file_extension>

PATH_TO_FILES="${PATH_TO_FILES:-$1}"
FILE_TYPE="${FILE_TYPE:-$2}"

# Check arguments
if [ -z "$PATH_TO_FILES" ] || [ -z "$FILE_TYPE" ]; then
    echo "Usage: $0 <directory> <file_extension>"
    echo "Example: $0 ~/photos jpg"
    exit 1
fi

# Check if directory exists
if [ ! -d "$PATH_TO_FILES" ]; then
    echo "Error: Directory '$PATH_TO_FILES' does not exist"
    exit 1
fi

# Rename files
counter=1
for file in "$PATH_TO_FILES"/*."$FILE_TYPE"; do
    # Check if file exists (handles case where no files match)
    [ -e "$file" ] || break
    
    # Generate new filename with 4-digit padding
    new_name=$(printf "%04d.$FILE_TYPE" "$counter")
    new_path="$PATH_TO_FILES/$new_name"
    
    # Skip if target already exists
    if [ -e "$new_path" ]; then
        echo "Skipping $(basename "$file") - target exists"
        ((counter++))
        continue
    fi
    
    # Rename the file
    echo "Renaming $(basename "$file") to $new_name"
    mv "$file" "$new_path"
    ((counter++))
done

echo "Done!"