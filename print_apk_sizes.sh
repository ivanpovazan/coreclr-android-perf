#!/bin/bash

source "$(dirname "$0")/init.sh"

# Navigate to the build directory
BUILD_DIR="./build"

# Check if the build directory exists
if [[ ! -d "$BUILD_DIR" ]]; then
    echo "Build directory does not exist: $BUILD_DIR"
    exit 1
fi

# Iterate through each folder in the build directory
find "$BUILD_DIR" -type f -name "*-Signed.apk" | while read -r apk_file; do
    # Get the size of the APK file
    apk_size=$(stat -f%z "$apk_file")
    # Print the full path and size
    echo "File: $apk_file, Size: $apk_size bytes"
    
    # Check if the "unzipped" argument is provided
    if [[ "$1" == "unzipped" ]]; then
        # Create an output directory based on the APK file's directory
        output_dir="$(dirname "$apk_file")/unpacked"
        apktool d -f -o "$output_dir" "$apk_file"
        # Calculate and print the size of the unpacked directory
        unpacked_size=$(du -sk "$output_dir" | cut -f1)
        echo "Unpacked size of $output_dir: $unpacked_size KB"
    fi
done