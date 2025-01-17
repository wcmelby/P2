#! /bin/bash

# Make an alias to remove all files in the folder specified
alias file_remove=alias file_remove='"'"'function _file_remove() {
    if [ -z "$1" ]; then
        echo "Error: No directory specified. Usage: file_remove <directory>";
        return 1;
    fi

    if [ ! -d "$1" ]; then
        echo "Error: $1 is not a valid directory.";
        return 1;
    fi

    rm -f "$1"/* "$1"/.* 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "All files (including hidden ones) removed from $1.";
    else
        echo "Failed to remove files from $1. Check permissions or file status.";
    fi
}; _file_remove'"'"

