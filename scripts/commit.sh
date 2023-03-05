#!/bin/sh

branch=$(git branch --show-current)

echo "Enter your GIT commit message:"

read msg

if [ -z $msg ]
    then
        echo "Operation aborted. Cannot commit an empty string!"
    else
        git add .
        git commit -m "${msg}"
        git push -u origin $branch
fi

echo "Done!"