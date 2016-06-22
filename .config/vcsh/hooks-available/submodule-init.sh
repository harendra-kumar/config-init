#!/bin/bash

# We hide the .gitmodules in the repo root so that multiple repos do not have a
# conflict. We have a copy of .gitmodules in .config/repo-name instead.
# So we checkout the submodule from ~/.config/repo-name instead of form home.
VCSH_REPO_NAME=$(basename $GIT_DIR)
VCSH_REPO_NAME=${VCSH_REPO_NAME%.git}
WORKTREE=~/.config/$VCSH_REPO_NAME

if test -d $WORKTREE
then
  unset GIT_WORK_TREE
  cd $WORKTREE && vcsh $VCSH_REPO_NAME --work-tree $WORKTREE submodule update --init --recursive
fi
