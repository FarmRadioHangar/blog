#!/bin/bash
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t casper -d public

# Go To Public folder
cd public

# Add changes to git.
git add -A .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# workaround
git remote set-url origin https://$GIT_NAME:$GIT_PASSWD@github.com/FarmRadioHangar/FarmradioHangar.github.io.git 

git remote -v

# Push source and build repos.
git push --force origin master

# Come Back
cd ..
