#!/bin/bash

# backup old profile just in case
if [ -f ~/.bash_profile ]; then
  mv ~/.bash_profile ~/.bash_profile_old
fi

# create links
ln -sFf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sFf ~/.dotfiles/gitignore_global ~/.gitignore_global
ln -sFf ~/.dotfiles/bashrc ~/.bashrc
ln -sFf ~/.dotfiles/tool-versions ~/.tool-versions
ln -sFf ~/.dotfiles/bash_profile ~/.bash_profile
ln -sFf ~/.dotfiles/Brewfile ~/.Brewfile
