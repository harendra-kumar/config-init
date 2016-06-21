#!/bin/bash

# $1: src
backup () {
  local src=$1
  local dst=${src}.orig

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