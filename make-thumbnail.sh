#!/usr/bin/env bash
# set -xv

# Accept path to source file and path to thumbnail as command line arguments
source_file=$1
thumbnail=$2

# Generate thumbnail using ImageMagick
# convert "$source_file" -resize 50% "$thumbnail"
convert -background none "$source_file" -thumbnail 200x200 "$thumbnail"