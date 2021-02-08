#!/bin/bash
UPLOAD_DIRECTORY="/project/api_uploaded_files"
OUTPUT_DIRECTORY="/project/api_output_files"

files=$(ls "$UPLOAD_DIRECTORY")

for value in ${files}
do
    echo "file '${value}'" >> "${UPLOAD_DIRECTORY}/mylist.txt"
done

pushd "${UPLOAD_DIRECTORY}" || true
ffmpeg -f concat -safe 0 -i mylist.txt -c copy ${OUTPUT_DIRECTORY}/output.mp4
popd || true
