#!/bin/bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install homebrew tools
brew install \
bash-completion \
curl \
carthage \
cloc \
cmake \
git \
gpg \
imagemagick \
keybase \
ninja \
rbenv \
rsync \
sourcekitten \
swiftlint \
the_silver_searcher \
wget \
xcproj

# optional: mogenerator, mitmproxy, privoxy, oclint, jenkins, android-sdk, tinyproxy,

# install caskroom
brew tap caskroom/cask

# install casks
brew cask install \
atom \
appcode \
brave \
caffeine \
disk-inventory-x \
firefox \
flux \
font-awesome-terminal-fonts \
font-fira-code \
font-hack \
font-inconsolata \
github-desktop \
iterm2 \
keepassx \
p4merge \
postman \
quickradar \
textual \
wwdc \
xquartz
# optional: macdown

# install apps manually
# CCMenu
# Dash
# Deckset
# Dropbox
# Fabric
# JenkinsStatusItem
# PHPStorm
# Safari Tech Preview
# Server.app
# Slack
# SourceTree
# Spotify
# Sync
# TorBrowser
# TweetBot
# Twitter

# install atom config
apm install sync-settings
# https://gist.github.com/klundberg/e08348e4496e9e7a7911600dd0e1afeb

# install oh-my-git
git clone https://github.com/arialdomartini/oh-my-git.git ~/.oh-my-git

# install rbenv versions
rbenv install 2.0.0-p648
rbenv global 2.0.0-p648

# install gems
gem install \
badge \
bundler \
cocoapods \
fastlane \
synx \
xcode-install
# optional: danger

# create links
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.bashrc ~/.bashrc

# reminder to install other things
# 1. update github private ssh key
