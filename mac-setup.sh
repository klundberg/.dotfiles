#!/bin/bash

set -euo pipefail

# reminder to install other things
# 1. update github private ssh key

xcode-select --install

# Get running directory of script so we can call other scripts in the same dir.
ORIGINAL_DIR=$(pwd)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$ORIGINAL_DIR"

"$DIR"/update-settings.sh

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# link brewfile and install via brew-bundle
ln -s ~/.dotfiles/Brewfile ~/.Brewfile
/usr/local/bin/brew bundle --global

# install asdf-managed tools and languages
/usr/local/opt/asdf/bin/asdf plugin-add nodejs
/usr/local/opt/asdf/bin/asdf plugin-add python
/usr/local/opt/asdf/bin/asdf plugin-add ruby
/usr/local/opt/asdf/bin/asdf plugin-add rust
/usr/local/opt/asdf/bin/asdf plugin-add swiftlint https://github.com/klundberg/asdf-swiftlint.git

ln -s ~/.dotfiles/tool-versions ~/.tool-versions
/usr/local/opt/asdf/bin/asdf install

# install gems
$(asdf which gem) install bundler xcode-install
/usr/local/opt/asdf/bin/asdf reshim ruby # adds gems back to path

# configure fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

defaults write com.apple.finder AppleShowAllFiles TRUE
killall finder

defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES

# configure oh-my-fish
/usr/local/bin/curl -L https://get.oh-my.fish | fish
rm -rf ~/.config/omf
ln -s ~/.dotfiles/config/fish ~/.config/fish
ln -s ~/.dotfiles/config/omf ~/.config/omf
omf install
omf reload
