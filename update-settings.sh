#!/bin/bash

# write custom bash profile per-environment
echo "Choose your environment:"
select myenv in "Home" "Work"; do
  case $myenv in
    Home ) LOCATION=Home; break;;
    Work ) LOCATION=Work; break;;
  esac
done

# create links
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/atom/packages.cson ~/.atom/packages.cson

# backup old profile just in case
if [ -f ~/.bash_profile ]; then
  mv ~/.bash_profile ~/.bash_profile_old
fi

# write new profile
echo "#!/bin/bash

export LOCATION=$LOCATION

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi" > ~/.bash_profile
