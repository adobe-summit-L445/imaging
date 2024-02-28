#!/bin/bash

echo "Hello Seat ${SEAT}"

# Create GitHub configs and credentials
touch ~/.gitconfig

git config --global credential.helper store
git config --global user.name "Adobe Summit"
git config --global user.email "no-reply@github.com"
git config --global credential.https://github.com/adobe-summit-L445.username adobe-summit-l445-user

touch ~/.git-credentials
echo "https://adobe-summit-l445-user:${GITHUB_TOKEN}@github.com" > ~/.git-credentials

# Checkout repository
cd ~
git clone "https://github.com/adobe-summit-L445/seat-${SEAT}.git"
cd ~/seat-${SEAT}

# Double check push rights
git push

# Use nvm to set Node 20
source ~/.nvm/nvm.sh
nvm alias default 20
nvm use default

# Run npm install
npm install

# Create desktop shortcut for Goole Drive
driveLink=$(cat fstab.yaml | yq '.mountpoints./')
echo "open -a 'Google Chrome' '${driveLink}'" > ~/Desktop/GoogleDrive.command
chmod +x ~/Desktop/GoogleDrive.command

# Create desktop shortcut for GitHub
echo "open -a 'Google Chrome' 'https://github.com/adobe-summit-L445/seat-${SEAT}'" > ~/Desktop/GitHub.command
chmod +x ~/Desktop/GitHub.command

echo "--- Setup complete ---"