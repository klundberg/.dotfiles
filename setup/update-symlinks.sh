#!/bin/bash

# files
ln -sFf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sFf ~/.dotfiles/gitignore_global ~/.gitignore_global
ln -sFf ~/.dotfiles/bashrc ~/.bashrc
ln -sFf ~/.dotfiles/zshrc ~/.zshrc
ln -sFf ~/.dotfiles/zshenv ~/.zshenv
ln -sFf ~/.dotfiles/tool-versions ~/.tool-versions
ln -sFf ~/.dotfiles/bash_profile ~/.bash_profile
ln -sFf ~/.dotfiles/Brewfile ~/.Brewfile
# directories
mkdir ~/.config || true 
ln -sFfh ~/.dotfiles/config/fish ~/.config/fish
ln -sFfh ~/.dotfiles/config/omf ~/.config/omf
