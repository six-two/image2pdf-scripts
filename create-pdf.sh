#!/usr/bin/env bash
# exit when any command fails
#set -e

if [ "$#" -lt 3 ]; then
    echo "Usage: <scale> <image_file...> <output_file>"
    echo "The resulting PDF sould have a DPI of '72 * <scale>' (rounded down). There may be small bugs, if scale is a floating point number."
    echo "Example: 1.5 path/to/scanned/images/*.jpg scan.pdf"
    exit 1
fi

scale_int() {
    # (...)/1 is rounds down (and makes it an int again)
    #echo "bc: ($1*$SCALE)/1"
    echo `echo "($1*$SCALE)/1" | bc`
}

# Use scale to increase / decrease the DPI. Bigger values result in prettier files, but they also increase file size
SCALE="$1"
shift;
# This should result in DIN A4 sized output
DPI=`scale_int 72`
WIDTH=`scale_int 595`
HEIGHT=`scale_int 842`
RES="${WIDTH}x${HEIGHT}"
echo "Size: $RES; DPI: $DPI"

# Downscale images, centers them and convert them to a pdf
convert -units pixelsperinch -density "$DPI" -gravity center -format pdf -resize "$RES" -extent "$RES" -page "$RES" -quality 50 "$@"
