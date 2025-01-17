#!/bin/bash

# Run this bash script from the electron_scattering_data directory
# cd "./electron_scattering_data" || { echo "Directory not found!"; exit 1; }

# Create directories for odd and even files
mkdir -p odd even

# for loop
for file in electron_scattering_2023-10-04_sample_index_*.bin; do
    # Extract the index from the file name using pattern matching
    index=$(echo "$file" | grep -oP '(?<=_index_)\d+')

    # Check if the index is odd or even
    if (( index % 2 == 0 )); then
        mv "$file" even/
    else
        mv "$file" odd/
    fi
done

echo "Files have been sorted into 'odd' and 'even' directories."
