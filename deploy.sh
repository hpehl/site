#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -gt 0 ] && [ "$1" != "--push" ]; then
  msg="${1}"
fi
if [ $# -gt 1 ] ; then
  shift
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the root
cd ..

# Push the main repo
if [ "${1}" == "--push" ]; then
    git commit -am "Push to https://hal.github.io" && git push origin master
fi
