#!/usr/bin/env bash

if [ "$1" != "--lenient" ]; then
    set -e pipefail
fi
set -uo

# Get running directory of script so we can call other scripts in the same dir.
ORIGINAL_DIR=$(pwd)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$ORIGINAL_DIR"

"$DIR"/setup/create-ssh-key.sh
"$DIR"/setup/update-symlinks.sh

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install asdf-managed tools and languages
asdf() {
    /usr/local/opt/asdf/bin/asdf "$@" || true
}

brew install asdf

asdf plugin-add nodejs
asdf plugin-add python
asdf plugin-add ruby
asdf plugin-add rust
asdf plugin-add golang
asdf plugin-add swiftlint

asdf install

$(asdf which gem) install bundler xcode-install
asdf reshim ruby # adds gems back to path

xcversion update
xcversion list
xcversion install 11.4

# install remaining things via brew-bundle
/usr/local/bin/brew bundle --global

# set some defaults settings
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES
defaults write com.apple.finder AppleShowAllFiles TRUE
killall finder

# configure fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish # after this, we will be running in fish

# configure oh-my-fish
/usr/bin/curl -sSL https://get.oh-my.fish > .temp-install-omf
fish .temp-install-omf --yes
rm .temp-install-omf
omf install
omf reload

cd "$ORIGINAL_DIR"
echo "You are all set!"
