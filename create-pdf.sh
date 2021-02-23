#!/usr/bin/env bash
# exit when any command fails
set -e

# Config options
MAX_RES="1500"

if [ "$#" -lt 2 ]; then
    echo "Usage: <image_file...> <output_file>"
    echo "Example: path/to/scanned/images/*.jpg scan.pdf"
    exit 1
fi

# Downscale images and convert them to a pdf
convert -units pixelsperinch -density 72 -page a4 -resize "${MAX_RES}x${MAX_RES}" -quality 50 "$@"
