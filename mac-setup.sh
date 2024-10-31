#!/usr/bin/env bash

if [ "$1" != "--lenient" ]; then
    setopt pipefail
fi
setopt verbose

# Get running directory of script so we can call other scripts in the same dir.
ORIGINAL_DIR=$(pwd)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$ORIGINAL_DIR" || return

"$DIR"/setup/create-ssh-key.sh
"$DIR"/setup/update-symlinks.sh

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

PATH=$PATH:/opt/homebrew/bin

brew install robotsandpencils/made/xcodes
brew install aria2

xcodes update
xcodes list
xcodes install --latest --experimental-unxip --select

# install mise-managed tools and languages
brew install mise
mise install -y

# install remaining things via brew-bundle
softwareupdate --install-rosetta &> /dev/null
brew bundle --global

# set some defaults settings
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES
defaults write com.apple.finder AppleShowAllFiles TRUE

# configure fish
echo "$(brew --prefix)"/bin/fish | sudo tee -a /etc/shells
chsh -s "$(brew --prefix)"/bin/fish # after this, we will be running in fish

# configure oh-my-fish
/usr/bin/curl -sSL https://get.oh-my.fish > .temp-install-omf
fish .temp-install-omf --yes
rm .temp-install-omf
omf install
omf reload

cd "$ORIGINAL_DIR" || return
echo "You are all set!"
