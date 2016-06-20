#!/bin/bash

# $1: src
# $2: dst
backup () {
  local src=$1
  local dst=$2

  if test -e $src
  then
    echo "Backing up $src to $dst ..."
    if test -e $dst
    then
      echo "Cannot backup, destination $dst already exists"
      exit 1
    fi
    mv $src $dst
  fi
}

backup ~/.emacs.d ~/.emacs.d.orig
