#!/bin/sh

if test "$VCSH_COMMAND" = "delete"
then
  vcsh $VCSH_REPO_NAME submodule deinit .
fi
