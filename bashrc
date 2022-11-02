#!/bin/bash

eval "$(brew shellenv)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

alias ls='ls -G'
alias unfuckxcode='rm -rf ~/Library/Developer/Xcode/DerivedData; rm -rf ~/Library/Caches/com.apple.dt.Xcode; echo -e "\xF0\x9F\x94\xA5 BURN IT ALL\xF0\x9F\x94\xA5"'

. $(brew --prefix asdf)/asdf.sh

export FASTLANE_USER=klundberg@wayfair.com
export XCODE_INSTALL_USER=klundberg@wayfair.com
