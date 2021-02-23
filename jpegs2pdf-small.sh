#!/usr/bin/env bash
# exit when any command fails
set -e

# Config options
TMP_FILE="/tmp/document.pdf"
#OUTPUT_FILE="/home/$USER/document.pdf"
OUTPUT_FILE="$1"
shift;
MAX_RES="1500"

if [ "$#" -le 3 ]; then
    echo "Error: Too few arguments (got only $#)"
    echo "Usage: <output_file> <metadata_title> <image_file...>"
    echo "Example: Certificate.pdf 'Certificate of Whatever' path/to/scanned/images/*.jpg"
    exit 1
fi

# Document Metadata
TITLE="$1"
shift;
AUTHOR="Patrick Schlueter"

# Downscale images and convert them to a pdf
convert -units pixelsperinch -density 72 -page a4 -resize "${MAX_RES}x${MAX_RES}" -quality 50 "$@" "${TMP_FILE}"

# Edit exif tags (metadata)
exiftool -Title="$TITLE" -Author="$AUTHOR" -Producer="" "${TMP_FILE}"

# Optimize the pdf
qpdf --linearize "${TMP_FILE}" "${OUTPUT_FILE}"
