#!/bin/bash

# filename patterns which match no files will expand to a null string
# needed for file in *jpg *png
shopt -s nullglob

shrink_suffix="_small"
shrink_width="480"

if [[ $1 == '-r' ]]; then
	echo "deleting all optimized files"
	rm *_small.*
fi

# resize all jpgs and optimize file size
#for file in *.jpg *.png; do
for file in *.jpg; do
	file_shrunk=$(echo "${file}" | sed -s "s/\([^.]*\)\([.].*\)/\1$shrink_suffix\2/")
	#echo $file
	#echo $file_shrunk
	if [[ "${file}" == *"_small."* ]]; then
		echo "skipping ${file} because it is an optimized file"
	elif [[ -f "${file_shrunk}" ]]; then
		echo "skipping ${file} because an associated optimized file exists"
	else
		echo "shrinking ${file} to ${file_shrunk}..."
		convert "${file}" -resize "$shrink_width"x\> "${file_shrunk}"
		#jpegoptim "${file_shrunk}"
	fi
done

