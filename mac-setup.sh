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

# install homebrew tools
brew install bash-completion \
  curl \
  carthage \
  cloc \
  cmake \
  fish \
  git \
  gpg \
  imagemagick \
  librsvg \
  mas \
  ninja \
  rbenv \
  sourcekitten \
  sourcery \
  swiftlint \
  the_silver_searcher \
  wget \
  xcproj

brew tap thoughtbot/formulae
brew install rcm

# optional: brew install mogenerator mitmproxy privoxy android-sdk tinyproxy

# install casks
brew tap caskroom/cask

brew cask install \
  atom \
  appcode \
  brave \
  brisk \
  caffeine \
  dash \
  disk-inventory-x \
  docker \
  firefox \
  flux \
  gitup \
  iterm2 \
  keepassx \
  keybase \
  paw \
  p4merge \
  postman \
  rocket \
  scroll-reverser \
  slack \
  sourcetree \
  textual \
  touche \
  vanilla \
  wwdc \
  xquartz

brew cask install caskroom/versions/safari-technology-preview

# optional:
# brew cask install dropbox
# brew cask install macdown
# brew cask install spotify
# brew cask install torbrowser

# install custom fonts
brew tap caskroom/fonts

brew cask install font-awesome-terminal-fonts
brew cask install font-fira-code
brew cask install font-hack
brew cask install font-inconsolata

# install mac app store apps
mas signin kevin@klundberg.com --dialog
mas install 417375580 # BetterSnapTool
mas install 603117688 # CCMenu
mas install 847496013 # Deckset
mas install 557168941 # Tweetbot

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
  synx \
  xcode-install
# optional:
# gem install danger

# configure fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

defaults write com.apple.finder   AppleShowAllFiles TRUE
killall finder

defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES

# configure oh-my-fish
curl -L https://get.oh-my.fish | fish
rm -rf ~/.config/omf
ln -s ~/.dotfiles/omf ~/.config
omf install
omf reload
