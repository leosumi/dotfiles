#! /bin/bash

while read package ; do
  # skip empty lines
  [ -z "$package" ] && continue
  # lines with # are comment
  [[ "$package" =~ ^#.*$ ]] && continue

  echo "Installing $package"
  apt install --assume-yes $package
done < packages.list

