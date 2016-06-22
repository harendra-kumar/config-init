#!/bin/bash

# $1: src
restore () {
  local src=$1
  local dst=${src}.vcsh-backup

  if test -e $dst
  then
    echo "Restoring $dst to $src ..."
    if test -e $src
    then
      echo "Cannot restore, source file [$src] already exists"
      echo "Please move or remove the backup or the original file and then retry"
      exit 1
    fi
    mv $dst $src
  fi
}

files=$(git ls-files)
for file in $files
do
  restore $file
done
