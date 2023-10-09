#!/bin/sh -l
git config --global --add safe.directory /github/workspace
git fetch --unshallow
git checkout $1
cd /app
bundle exec bugspots /github/workspace -b $1 -d $2 -w $3 > comments
cd /github/workspace
gh pr comment -F /app/comments $4