#!/bin/bash
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
pwd
# Build the project.
hugo -t casper -d public

# Go To Public folder
cd public
pwd

git status

# Add changes to git.
git add -A .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git status

# workaround

git remote -v

# Push source and build repos.
git push --force origin master

# Come Back
cd ..
