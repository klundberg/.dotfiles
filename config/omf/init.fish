# customize user paths and options
set --global SSH_AUTH_SOCK (realpath ~/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh)
set --global fish_user_paths ~/bin (realpath $OMF_CONFIG/../../bin) ~/.mint/bin ~/.fastlane/bin /opt/homebrew/bin /opt/homebrew/sbin

set --global theme_display_ruby no
set --global theme_color_scheme terminal
set --global theme_nerd_fonts yes

if [ -e ~/.dotfiles/local/init.fish ]
    source ~/.dotfiles/local/init.fish
end
