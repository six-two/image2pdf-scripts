#!/usr/bin/env bash

# exit when any command fails
set -e

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <pdf_file> [title] [author]"
    exit 1
fi

# Default metadata
TITLE="PDF Document"
AUTHOR="Patrick Schlüter"
PRODUCER="github.com/six-two/image2pdf-scripts"

# Handling of command line arguments
FILE="${1:?$USAGE}"
TITLE="${2:-$TITLE}"
AUTHOR="${3:-$AUTHOR}"

# Uncomment for debugging
#echo "'$TITLE', '$AUTHOR', '$PRODUCER'"

# Remove all metadata, then set title and the like
exiftool -overwrite_original -all:all= -Title="$TITLE" -Author="$AUTHOR" -Producer="$PRODUCER" "${FILE}"

# Optimize the pdf
qpdf --linearize --replace-input "${FILE}"
