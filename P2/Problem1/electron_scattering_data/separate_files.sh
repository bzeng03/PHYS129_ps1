#!/bin/bash

# Create directories for odd and even indexed files
mkdir -p "electron scattering data/odd"
mkdir -p "electron scattering data/even"

# Loop through all files matching the pattern
for file in electron_scattering_2023-10-04_sample_index_*.bin; do
    # Extract the index from the file name using regex
    index=$(echo "$file" | grep -oP "(?<=_index_)\d+")
    
    # Check if the index is odd or even
    if (( index % 2 == 0 )); then
        # Move even-indexed files to the "even" directory
        mv "$file" "electron scattering data/even/"
    else
        # Move odd-indexed files to the "odd" directory
        mv "$file" "electron scattering data/odd/"
    fi
done
