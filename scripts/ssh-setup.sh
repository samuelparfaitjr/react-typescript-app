#!/bin/sh

# Generating a new SSH key
ssh-keygen -t ed25519 -C "samuelparfaitjr@gmail.com"

# Adding your SSH key to the ssh-agent
eval "$(ssh-agent -s)"

# Check to see if your ~/.ssh/config file exists in the default location
FILE=~/.ssh/config
if [ ! -f "$FILE" ]; then
    touch ~/.ssh/config
    printf "Host github.com \n AddKeysToAgent yes \n UseKeychain yes \n IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config
else
    printf "Host github.com \n AddKeysToAgent yes \n UseKeychain yes \n IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config
fi

# Add your SSH private key to the ssh-agent and store your passphrase in the keychain
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# Add the SSH key to your account on GitHub.
pbcopy < ~/.ssh/id_ed25519.pub

echo "SSH key successfully copied to clipboard :)"

sleep 3

open https://github.com/settings/ssh/new

