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
  keybase \
  librsvg \
  mas \
  ninja \
  rbenv \
  sourcekitten \
  swiftlint \
  the_silver_searcher \
  wget \
  xcproj

brew tap thoughtbot/formulae
brew install rcm

# optional: brew install mogenerator mitmproxy privoxy jenkins android-sdk tinyproxy

# install casks
brew tap caskroom/cask

brew cask install atom \
  appcode \
  brave \
  caffeine \
  dash \
  disk-inventory-x \
  firefox \
  flux \
  github-desktop \
  iterm2 \
  keepassx \
  p4merge \
  phpstorm \
  postman \
  quickradar \
  slack \
  sourcetree \
  textual \
  wwdc \
  xquartz
brew install kylef/formulae/swiftenv
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

# install manually:
# - Safari Tech Preview

# install mac app store apps
mas signin kevin@klundberg.com --dialog
mas install BetterSnapTool
mas install CCMenu
mas install Deckset
mas install Server
mas install Tweetbot
mas install Twitter

# install atom config
apm install sync-settings
# https://gist.github.com/klundberg/e08348e4496e9e7a7911600dd0e1afeb

# install oh-my-git
git clone https://github.com/arialdomartini/oh-my-git.git ~/.oh-my-git

# install rbenv versions
rbenv install 2.4.1
rbenv global 2.4.1

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

source ~/.bash_profile

# configure fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# configure oh-my-fish
curl -L https://get.oh-my.fish | fish
rm -rf ~/.config/omf
ln -s ~/.dotfiles/omf ~/.config/omf
omf install
omf reload
