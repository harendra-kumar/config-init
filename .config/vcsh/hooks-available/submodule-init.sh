#!/bin/sh

# We hide the .gitmodules in the repo root so that multiple repos do not have a
# conflict. We have a copy of .gitmodules in .config/repo-name instead.
# So we checkout the submodule from ~/.config/repo-name instead of form home.
unset GIT_WORK_TREE
echo "~/.config/$VCSH_REPO_NAME"
ls -al ~/.config/$VCSH_REPO_NAME
vcsh $VCSH_REPO_NAME --work-tree ~/.config/$VCSH_REPO_NAME submodule update --init --recursive
