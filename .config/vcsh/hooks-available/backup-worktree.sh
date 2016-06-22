#!/bin/bash

# $1: message
function die () {
  >&2 echo -e $1
  exit 1
}

# $1: src
backup () {
  local src=$1
  local dst=${src}.vcsh-backup

  if test -e $src
  then
    echo "Backing up $src to $dst ..."
    if test -e $dst
    then
      echo "Cannot backup, destination [$dst] already exists"
      echo "Please move or remove the backup or the original file and then retry"
      exit 1
    fi
    mv $src $dst
  fi
}

# GIT_DIR is exported by vcsh
VCSH_BRANCH="$(git symbolic-ref --short HEAD)"

while true
do
  file=$(git read-tree -n -mu origin/"$VCSH_BRANCH" 2>&1 \
          | sed -e "s/^[^']*'//" \
          | sed -e "s/'[^']*$//")

  test -n "$file" || break
  test -e "$file" || die "Bug: [$file] returned by git read-tree as a conflicting file, does not exist."
  backup  "$file" || exit 2
done
