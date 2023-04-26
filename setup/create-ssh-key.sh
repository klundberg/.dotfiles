#!/usr/bin/env bash

if [[ -a ~/.ssh/id_rsa && $1 != '--force' ]]; then
    # skip this if we already have an ssh key
    echo "SSH key found, we won't create a new one."
    exit 0;
fi

echo "Creating a new SSH key!"
echo "Please enter the email you wish to use to generate an ssh key pair:"
read -r EMAIL

# generate SSH key-pair and set up ssh config
# https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

ssh-keygen -t "ed25519" -C "$EMAIL"

# start the ssh agent
eval "$(ssh-agent -s)"

# edit ssh config with desired properties
echo "Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config

# add key to ssh-agent
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# # upload public key to GitHub (api?)
echo "Don't forget to upload the public key to github!"
echo "Opening https://github.com/settings/ssh/new and copying public key to your pasteboard."
pbcopy < ~/.ssh/id_ed25519.pub
open "https://github.com/settings/ssh/new"
