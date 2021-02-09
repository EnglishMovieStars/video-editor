#!/bin/bash
UPLOAD_DIRECTORY="/project/api_uploaded_files"
OUTPUT_DIRECTORY="/project/api_output_files"

files=$(ls "$UPLOAD_DIRECTORY")
file_ext="mp3"
for value in ${files}
do
    file_ext="${value##*.}"
    echo "file '${value}'" >> "${UPLOAD_DIRECTORY}/mylist.txt"
done
export MEDIA_FILE_TYPE="${file_ext}"
pushd "${UPLOAD_DIRECTORY}" || true
ffmpeg -f concat -safe 0 -i mylist.txt -c copy "${OUTPUT_DIRECTORY}/output.${file_ext}"
popd || true
