#! /usr/bin/env bash
######################################################################
# This script generates thumbnails for all images in a directory.
# It uses the make-thumbnail.sh script to generate thumbnails.
#
# Usage: ./thumbs.sh <directory> <thumbnail directory>
#
# Example: ./thumbs.sh ~/Pictures ~/Pictures/thumbnails
######################################################################

# This is used for debugging    
# set -xv

# This is used in shell scripting to enable the "exit immediately if any command exits with a non-zero status" mode.
set -e



# Accept path to directory and thumbnail directory as command line arguments
dir=$1
thumbdir=$2



# Set constants - Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"



# Define usage function
usage() {
    printf "${COL_RED}[!] No arguments provided${COL_RESET}\n"
    printf "${COL_GREEN} Usage: ${COL_RESET} %s /path/to/<directory>  /path/to/<thumbnail directory>\n" $0
    printf "${COL_CYAN} Example:${COL_RESET}./thumbs.sh ~/Downloads/pics ~/Downloads/pics\n"
    exit 1
}

usage2() {
    printf "${COL_GREEN} Usage: ${COL_RESET} %s /path/to/<directory>  /path/to/<thumbnail directory>\n" $0
    printf "${COL_CYAN} Example:${COL_RESET}./thumbs.sh ~/Downloads/pics ~/Downloads/pics\n"
    exit 1
}


# Check if directory and thumbnail directory are provided
if [[ -z "$dir" || -z "$thumbdir" ]]; then
    echo -e "${COL_RED}[!]  Error:${COL_RESET} Please provide a directory and thumbnail directory."
    usage2
    exit 1
fi


# Check if directory exists
if [[ ! -d "$dir" ]]; then
    echo -e "${COL_RED}[!] Error:${COL_RESET} $dir is not a directory."
    exit 1
fi

# Check if thumbnail directory exists
if [[ ! -d "$thumbdir" ]]; then
    echo -e "${COL_RED}[!] Error:${COL_RESET} $thumbdir is not a directory."
    exit 1
fi

# Check if ImageMagick is installed
if ! command -v convert >/dev/null 2>&1; then
    # ImageMagick is not installed
    echo "Error: ImageMagick is not installed."
    if [[ $(uname -s) == "Darwin" ]]; then
        # macOS - suggest installing via Homebrew
        echo "To install ImageMagick on macOS, run the following command:"
        echo "brew install imagemagick"
    fi
    exit 1
fi

# Check if fd is installed
if ! command -v fd >/dev/null 2>&1; then
    # fd is not installed
    echo "Error: fd is not installed."
    if [[ $(uname -s) == "Darwin" ]]; then
        # macOS - suggest installing via Homebrew
        echo "To install fd on macOS, run the following command:"
        echo "brew install fd"
    fi
    exit 1
fi

    # Find all .jpg and .png files in directory and subdirectories using fd
    fd -t f -e jpg -e png . ${dir}| while read file; do
        # Check if file is a thumbnail
        if [[ "$(basename "$file")" =~ ^th-.*\.png$ ]]; then
            continue
        fi
        # Generate thumbnail using make-thumbnail script
        thumbnail="${thumbdir}/th-$(basename "$file" | sed 's/\.[^.]*$//').png"
        ./make-thumbnail.sh "$file" "$thumbnail"

        # Print message for each thumbnail generated
        echo -e "${COL_GREEN}[+]${COL_RESET} Generated thumbnail for $file"
    done

# Exit the script gracefully
exit 0
