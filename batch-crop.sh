#!/usr/bin/env bash
# Usage: <width:height:x_offset:y_offset> <image_files...>

# exit when any command fails
set -e

dimensions="$1"
shift;

path_dir=`dirname "$1"`
new_path_dir="$path_dir/cropped"
rm -rf $new_path_dir
echo "Writing files to $new_path_dir"
mkdir $new_path_dir

for file in "$@"
do
  echo "Reading $file"
  file_name=`basename "$file"`
  new_file="$new_path_dir/$file_name"
  echo "Writing $new_file"
  convert "$file" -crop "$dimensions" "$new_file"
done
