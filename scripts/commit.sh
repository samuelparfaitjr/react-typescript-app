#!/bin/sh

BRANCH=$(git branch --show-current)

echo "Enter your GIT commit message:"

read MSG

if [ -z "$MSG" ]; then
    echo "Operation aborted. You provided an empty string!"
else
    git add .
    git commit -m "$MSG"
    git push -u origin $BRANCH
fi

echo "Done!"