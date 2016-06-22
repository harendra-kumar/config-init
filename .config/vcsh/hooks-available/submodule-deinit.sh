#!/bin/sh

# See comments in the submodule init script about work-tree dir change here
if test "$VCSH_COMMAND" = "delete"
then
  unset GIT_WORK_TREE
  WORKTREE=~/.config/$VCSH_REPO_NAME
  cd $WORKTREE && vcsh $VCSH_REPO_NAME --work-tree $WORKTREE submodule deinit .
fi
