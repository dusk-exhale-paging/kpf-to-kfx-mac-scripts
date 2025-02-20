#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create Converted KFX PDOC folder in the script's directory if it doesn't exist
mkdir -p "$SCRIPT_DIR/Converted KFX PDOC"

# Change to the script's directory
cd "$SCRIPT_DIR"

# Find and convert all .kpf files, only in this directory and its subdirectories
find "$SCRIPT_DIR" -name "*.kpf" -type f | while read file; do
    echo "Converting: $file"
    # Get the directory of the current .kpf file
    dir=$(dirname "$file")
    # Get just the filename without the path
    filename=$(basename "$file" .kpf)
    # Create output directory path
    output_dir="$SCRIPT_DIR/Converted KFX PDOC"
    
    # Run conversion with -d flag for personal document
    /Applications/calibre.app/Contents/MacOS/calibre-debug -r "KFX Output" -- -d "$file"
    
    # Move the converted .kfx file to the Converted KFX PDOC folder
    if [ -f "$dir/$filename.kfx" ]; then
        mv "$dir/$filename.kfx" "$output_dir/"
        echo "Moved $filename.kfx to Converted KFX PDOC folder"
    fi
done

echo "Conversion complete! All .kfx files are in the Converted KFX PDOC folder"