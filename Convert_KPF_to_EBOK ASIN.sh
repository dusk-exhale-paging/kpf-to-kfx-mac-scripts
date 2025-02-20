#!/bin/bash

# Define text formatting
BOLD='\033[1m'
NORMAL='\033[0m'

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create the output folder if it doesn't exist
mkdir -p "$SCRIPT_DIR/Converted KFX to EBOK with ASIN"

# Change to the script's directory
cd "$SCRIPT_DIR"

# Process each .kpf file with proper handling of spaces and special characters
while IFS= read -r -d $'\0' file; do
    echo "----------------------------------------"
    echo -e "${BOLD}Processing: $file${NORMAL}"
    # Get the directory of the current .kpf file
    dir=$(dirname "$file")
    # Get just the filename without the path and extension
    filename=$(basename "$file" .kpf)
    # Create output directory path
    output_dir="$SCRIPT_DIR/Converted KFX to EBOK with ASIN"
    
    # Prompt for ASIN and wait for input
    echo -e -n "${BOLD}Please enter the Kindle ASIN for \"$filename\": ${NORMAL}"
    read -r asin < /dev/tty
    
    echo -e "${BOLD}Converting with ASIN: $asin${NORMAL}"
    
    # Run conversion with the provided ASIN
    /Applications/calibre.app/Contents/MacOS/calibre-debug -r "KFX Output" -- -a "$asin" "$file"
    
    # Move the converted .kfx file to the output folder
    if [ -f "$dir/$filename.kfx" ]; then
        mv "$dir/$filename.kfx" "$output_dir/"
        echo -e "${BOLD}Successfully moved $filename.kfx to Converted KFX to EBOK with ASIN folder${NORMAL}"
        echo "----------------------------------------"
    fi
done < <(find "$SCRIPT_DIR" -name "*.kpf" -type f -print0)

echo "----------------------------------------"
echo -e "${BOLD}Conversion process complete!${NORMAL}"
echo -e "${BOLD}All converted files can be found in: Converted KFX to EBOK with ASIN folder${NORMAL}"
echo "----------------------------------------"