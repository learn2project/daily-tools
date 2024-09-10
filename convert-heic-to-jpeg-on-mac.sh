#!/bin/bash

# Loop through all .heic files in the current directory
for file in *.heic; do
    # Convert .heic to .jpeg using sips
    sips -s format jpeg "$file" --out "${file%.*}.jpeg"
    
    # Check if conversion was successful, then remove the .heic file
    if [ $? -eq 0 ]; then
        rm "$file"
        echo "Converted and removed: $file"
    else
        echo "Failed to convert: $file"
    fi
done
