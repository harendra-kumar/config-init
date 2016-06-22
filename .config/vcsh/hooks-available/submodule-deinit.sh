#!/bin/sh

# See comments in the submodule init script about work-tree dir change here
unset GIT_WORK_TREE
if test "$VCSH_COMMAND" = "delete"
then
  vcsh $VCSH_REPO_NAME --work-tree ~/.config/$VCSH_REPO_NAME submodule deinit .
fi
