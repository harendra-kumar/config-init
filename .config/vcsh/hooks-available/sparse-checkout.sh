#!/bin/sh

git config core.sparseCheckout true

# Hide anything not starting with . in root of repo
if [ ! -f $GIT_DIR/info/sparse-checkout ]; then
  cat >> $GIT_DIR/info/sparse-checkout << EOF
*
!/*
/.*
!/.gitmodules
!.gitignore
!.travis.yml
EOF
fi
