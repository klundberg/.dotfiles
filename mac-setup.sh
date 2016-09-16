#!/bin/bash

# create links
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/bashrc ~/.bashrc

# write custom bash profile per-environment
echo "Choose your environment:"
select myenv in "Home" "Work"; do
    case $myenv in
        Home ) LOCATION=Home; break;;
        Work ) LOCATION=Work; break;;
    esac
done

# backup old profile just in case
if [ -f ~/.bash_profile ]; then
  mv ~/.bash_profile ~/.bash_profile_old
fi

# write new profile
echo "#!/bin/bash

export LOCATION=$LOCATION

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi" > ~/.bash_profile

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
# BetterSnapTool
# CCMenu
# Dash
# Deckset
# Dropbox/Sync
# Fabric
# JenkinsStatusItem
# PHPStorm
# Safari Tech Preview
# Server.app
# Slack
# SourceTree
# Spotify
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
cocoapods \
fastlane \
synx \
xcode-install
# optional: danger

# reminder to install other things
# 1. update github private ssh key
