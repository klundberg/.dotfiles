if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH

alias ls='ls -G'

source $HOME/.oh-my-git/prompt.sh

eval "$(rbenv init -)"

alias unfuckxcode='rm -rf ~/Library/Developer/Xcode/DerivedData; rm -rf ~/Library/Caches/com.apple.dt.Xcode; echo -e "\xF0\x9F\x94\xA5 BURN IT ALL\xF0\x9F\x94\xA5"'

if [ "$LOCATION" == "Work" ]; then
  # wayfair
  export FASTLANE_USER='klundberg@wayfair.com'
  export XCODE_INSTALL_USER='klundberg@wayfair.com'

  source $HOME/.virtualenvs/wayrunner/bin/activate
  alias wr='wayrunner'
  eval "$(_WAYRUNNER_COMPLETE=source wayrunner)"

  alias rbt-ios='rbt post -g -o --target-groups=iOS'

  export VAGRANT_HOST_SOURCE_PATH=$HOME/workspaces
  export VAGRANT_SSH_INSERT_KEY=true
else
  export FASTLANE_USER='kevin@klundberg.com'
  export XCODE_INSTALL_USER='kevin@klundberg.com'
fi
