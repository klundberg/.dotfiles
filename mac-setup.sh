#!/bin/bash

# reminder to install other things
# 1. update github private ssh key

xcode-select --install

# Get running directory of script so we can call other scripts in the same dir.
ORIGINAL_DIR=$(pwd)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $ORIGINAL_DIR

$DIR/update-settings.sh

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# link brewfile and install via brew-bundle
ln -s ~/.dotfiles/Brewfile ~/.Brewfile
brew bundle --global

# install atom config
apm install sync-settings
# https://gist.github.com/klundberg/e08348e4496e9e7a7911600dd0e1afeb

# install rbenv versions
rbenv install 2.5.0
rbenv global 2.5.0

# install gems
`rbenv which gem` install \
  badge \
  bundler \
  cocoapods \
  cocoapods-dependencies \
  fastlane \
  rubocop \
  rsense \
  synx \
  xcode-install
# optional:
# gem install danger

# configure fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

defaults write com.apple.finder AppleShowAllFiles TRUE
killall finder

defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES

# configure oh-my-fish
curl -L https://get.oh-my.fish | fish
rm -rf ~/.config/omf
ln -s ~/.dotfiles/config ~/.config
omf install
omf reload
