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
brew install bash-completion
brew install curl
brew install carthage
brew install cloc
brew install cmake
brew install git
brew install gpg
brew install imagemagick
brew install keybase
brew install ninja
brew install rbenv
brew install sourcekitten
brew install swiftlint
brew install the_silver_searcher
brew install wget
brew install xcproj

# optional: mogenerator, mitmproxy, privoxy, oclint, jenkins, android-sdk, tinyproxy,

# install caskroom
brew tap caskroom/cask

# install casks
brew cask install atom
brew cask install appcode
brew cask install brave
brew cask install caffeine
brew cask install dash
brew cask install disk-inventory-x
brew cask install firefox
brew cask install flux
brew cask install font-awesome-terminal-fonts
brew cask install font-fira-code
brew cask install font-hack
brew cask install font-inconsolata
brew cask install github-desktop
brew cask install iterm2
brew cask install keepassx
brew cask install p4merge
brew cask install phpstorm
brew cask install postman
brew cask install quickradar
brew cask install slack
brew cask install textual
brew cask install wwdc
brew cask install xquartz
# optional: macdown

# install apps manually
# BetterSnapTool
# CCMenu
# Deckset
# Dropbox/Sync
# Fabric
# JenkinsStatusItem
# Safari Tech Preview
# Server.app
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
rubocop \
synx \
xcode-install
# optional: danger

# reminder to install other things
# 1. update github private ssh key
