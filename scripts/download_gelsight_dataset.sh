#!/bin/bash
set -euo pipefail

# set path to the directory to download the dataset
path_dataset="/sg-pretrain/luca/data/"

mkdir -p "$path_dataset/gelsight"
cd "$path_dataset/gelsight"

# download object_folder dataset
echo "Downloading the backbone dataset gelsight/object_folder..."
gdown "https://drive.google.com/drive/folders/1kgKj3BhvSN8bF1hI2bjeqhcaCHyxJUss?usp=sharing" --folder

# download touch_go dataset
echo "Downloading the backbone dataset gelsight/touch_go..."
gdown "https://drive.google.com/drive/folders/1Rpy9ZHCfJjwycj7TMuEbwwHEtH79ls8D?usp=sharing" --folder

# extract files (tarballs are likely downloaded directly into touch_go)
cd "./touch_go" || exit 1

# If no matches, don't treat globs as literal strings
shopt -s nullglob

for f in *.tar.gz; do
  echo "Extracting $f ..."
  tar -xvf "$f"
done

# Remove tarballs after extraction (only if they exist)
rm -f *.tar.gz

echo "Done!"