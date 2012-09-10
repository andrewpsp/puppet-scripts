#!/usr/bin/env bash
# This is a silly QnD that lets you develop in the staging sub modules, then
# run this to go into each one to commit and push. Saves you some keystrokes.

export COMMIT_MESSAGE="$1"

if [ -z "$COMMIT_MESSAGE" ]; then
   printf "You must enter a commit message as the only argument to this script!\n" >&2
   exit -1
fi

git submodule foreach 'if [[ $path =~ ^staging.* ]]; then git checkout develop; git add .; git commit -am "$COMMIT_MESSAGE"; git push -u origin develop; fi'

git commit -am "Updated submodules: $COMMIT_MESSAGE"
git push

#vim: set expandtab ts=3 sw=3:
