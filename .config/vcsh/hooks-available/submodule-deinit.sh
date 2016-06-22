#!/bin/bash

# See comments in the submodule init script about work-tree dir change here
if test "$VCSH_COMMAND" = "delete"
then
  VCSH_REPO_NAME=$(basename $GIT_DIR)
  VCSH_REPO_NAME=${VCSH_REPO_NAME%.git}
  unset GIT_WORK_TREE
  WORKTREE=~/.config/$VCSH_REPO_NAME
  cd $WORKTREE && vcsh $VCSH_REPO_NAME --work-tree $WORKTREE submodule deinit .
fi
