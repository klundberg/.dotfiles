#!/bin/bash

# create links
ln -sFf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sFf ~/.dotfiles/gitignore_global ~/.gitignore_global
ln -sFf ~/.dotfiles/bashrc ~/.bashrc
ln -sFf ~/.dotfiles/tool-versions ~/.tool-versions

# backup old profile just in case
if [ -f ~/.bash_profile ]; then
  mv ~/.bash_profile ~/.bash_profile_old
fi

# write new profile
echo "#!/bin/bash

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi" > ~/.bash_profile
