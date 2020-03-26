#!/usr/bin/env bash

set -euo pipefail

# go home first
cd ~

# install command line tools
xcode-select --install || true

# clone dot files repo
git clone https://github.com/klundberg/.dotfiles.git 

# execute dot files main setup
.dotfiles/mac-setup.sh
