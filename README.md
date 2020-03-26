# .dotfiles

System setup/maintenance scripts

This repo contains scripts to set up and configure settings of various shells, developer tools, and the like.

The `mac-setup.sh` script will create a new ssh key if needed, and install a bunch of development tools that I use.

The `pre-clone-setup.sh` script is intended to be run from a brand new machine, and it will set up xcode cli tools, clone this repo, then run `mac-setup.sh`.

To run it, execute this command from your console:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/klundberg/.dotfiles/master/pre-clone-setup.sh)"
```
