#!/usr/bin/env zsh

set -euo pipefail

# Get running directory of script so we can call other scripts in the same dir.
ORIGINAL_DIR=$(pwd)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$ORIGINAL_DIR"

"$DIR"/setup/create-ssh-key.sh
"$DIR"/setup/update-symlinks.sh

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# link brewfile and install via brew-bundle
/usr/local/bin/brew bundle --global

# install asdf-managed tools and languages
asdf() {
    /usr/local/opt/asdf/bin/asdf "$@"
}
asdf plugin-add nodejs
asdf plugin-add python
asdf plugin-add ruby
asdf plugin-add rust
asdf plugin-add swiftlint https://github.com/klundberg/asdf-swiftlint.git

asdf install

$(asdf which gem) install bundler xcode-install
asdf reshim ruby # adds gems back to path

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
