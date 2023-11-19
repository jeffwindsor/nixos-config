#!/usr/bin/env bash

# remove old fortune files
sudo rm -f /usr/share/games/fortune/*

# get all files with no extension in current directory
cd "$(dirname "$0")" || exit
shopt -s extglob
files=(!(*.*))

# compile fortune files
for file in "${files[@]}"
do
  echo "compiling $file"
  rm -f "$file".dat
  strfile -c % "$file" "$file".dat

  echo "copying $file and $file.dat"
  sudo cp "$file" /usr/share/games/fortune/
  sudo mv "$file".dat /usr/share/games/fortune/

  echo
done
