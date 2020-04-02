# customize user paths
set --global SSH_AUTH_SOCK (realpath ~/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh)
set --global fish_user_paths ~/bin (realpath $OMF_CONFIG/../../bin) ~/.fastlane/bin /usr/local/sbin

set --global theme_display_ruby no

# aliases
alias ls='ls -G'
alias unfuckxcode='rm -rf ~/Library/Developer/Xcode/DerivedData; rm -rf ~/Library/Caches/com.apple.dt.Xcode; echo -e "\xF0\x9F\x94\xA5 BURN IT ALL\xF0\x9F\x94\xA5"'

# setup asdf
set --global ASDF_DIR (brew --prefix asdf)
source "$ASDF_DIR/asdf.fish"

if [ -e ~/.dotfiles/local/init.fish ]
    source ~/.dotfiles/local/init.fish
end