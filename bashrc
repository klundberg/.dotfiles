if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Aliases
alias ls='ls -G'

source $HOME/.oh-my-git/prompt.sh

eval "$(rbenv init -)"

export PATH=~/bin:/usr/local/sbin:/usr/local/bin:$PATH

# wayfair
export FASTLANE_USER='klundberg@wayfair.com'
export XCODE_INSTALL_USER='klundberg@wayfair.com'

source $HOME/.virtualenvs/wayrunner/bin/activate
alias wr='wayrunner'
eval "$(_WAYRUNNER_COMPLETE=source wayrunner)"
alias rbt-ios='rbt post -g -o --target-groups=iOS'

export VAGRANT_HOST_SOURCE_PATH=~/workspaces
export VAGRANT_SSH_INSERT_KEY=true
