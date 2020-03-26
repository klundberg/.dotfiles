#!/usr/bin/env zsh

set -euo pipefail

# go home first
cd ~

# install command line tools
xcode-select --install

# clone dot files repo
git clone https://github.com/klundberg/.dotfiles.git 

# execute dot files main setup
.dotfiles/mac-setup.sh
