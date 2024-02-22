#!/bin/bash

echo "Hello World on seat ${SEAT}"

# Create GitHub configs and credentials
touch ~/.gitconfig

git config --global credential.helper store
git config --global user.name "Adobe Summit"
git config --global user.email "no-reply@github.com"
git config --global credential.https://github.com/adobe-summit-L445.username adobe-summit-l445-user
cat ~/.gitconfig

touch ~/.git-credentials
echo "https://adobe-summit-l445-user:${GITHUB_TOKEN}@github.com" > ~/.git-credentials

cat ~/.git-credentials

# Checkout repository

# Run npm install