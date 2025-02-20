# KPF to KFX macOS Conversion Scripts

This repository contains two macOS shell scripts for batch converting KPF files to KFX format using Calibre and the KFX Output plugin.

## Description

*   **Convert\_KPF\_to\_EBOK\_ASIN.sh:** Converts KPF files to KFX (EBOK) format and prompts for the ASIN of each file. This is recommended if you prefer having proper metadata (series and such) from goodreads.
*   **Convert\_KPF\_to\_PDOC.sh:** Converts KPF files to KFX (PDOC) format and is automated. No ASIN are not asked in this script. This is recommended for Manga sideloads from Amazon, where there is only minor adjustments when it comes to what you prefer.

## Requirements

*   macOS
*   Calibre: Installed in the default location (/Applications)
*   KFX Output plugin: Installed in Calibre
*   Kindle Previewer: for the KFX Output plugin to work
*   Terminal: Basic understanding of navigation

## Installation
1.  Download the .sh files to a convenient location
2. Open Terminal
3. To make them executable:
cd /Downloads # or wherever you downloaded the files to
chmod +x Convert_KPF_to_EBOK_ASIN.sh
chmod +x Convert_KPF_to_PDOC.sh

##EBOK Usage
1. Place script in folder with .kpf files
2. Open Terminal
- You can right-click on the file path in your desired folder and open Terminal
- Alternatively, you can navigate to the folder in Terminal with:
cd /path/to/your/folder
3. Run script:
bash Convert_KPF_to_EBOK_ASIN.sh
4. If running the EBOK script, enter the ASIN when prompted for each file; otherwise, wait until the process is finished
5. Find converted files in "Converted KFX to EBOK with ASIN folder"

##PDOC Usage
1. Place script in folder with .kpf files
2. Open Terminal
- You can right-click on the file path in your desired folder and open Terminal
- Alternatively, you can navigate to the folder in Terminal with:
cd /path/to/your/folder
3. Run script:
bash Convert_KPF_to_PDOC.sh
4. Wait until process is finished
5. Find converted files in "Converted KFX to PDOC"
