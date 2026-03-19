#!/bin/bash
set -euo pipefail

# set path to the directory to download the dataset
path_dataset="/sg-pretrain/luca/data/"

mkdir -p "$path_dataset/digitv1"
cd "$path_dataset/digitv1"

echo "Downloading the backbone dataset for DIGITv1..."
gdown "https://drive.google.com/drive/folders/19vs-5dSqakiJ96ykBdHbhDuc8EoYK0eg?usp=sharing" --folder

# extract files
cd "./Object-Slide"

# If no matches, don't treat globs as literal strings
shopt -s nullglob

# Extract all tarballs that were downloaded directly into this folder
for f in *.tar.gz; do
  echo "Extracting $f ..."
  tar -xvf "$f"
done

# Remove tarballs after extraction (only if they exist)
rm -f *.tar.gz

echo "Done!"
