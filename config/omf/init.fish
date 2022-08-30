# customize user paths
set --global SSH_AUTH_SOCK (realpath ~/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh)
set --global fish_user_paths ~/bin (realpath $OMF_CONFIG/../../bin) ~/.mint/bin ~/.fastlane/bin /usr/local/sbin ~/Library/Android/sdk/platform-tools/ /Volumes/External/Developer/Android/sdk/platform-tools

set --global theme_display_ruby no
set --global theme_color_scheme terminal
set --global theme_nerd_fonts yes

# Java
set --global JAVA_HOME (/usr/libexec/java_home)
# Android
set --global ANDROID_SDK_ROOT /Volumes/External/Developer/Android/sdk/

# setup asdf
set --global ASDF_DIR "$(brew --prefix asdf)/libexec"
source "$(brew --prefix asdf)/libexec/asdf.fish"

if [ -e ~/.dotfiles/local/init.fish ]
    source ~/.dotfiles/local/init.fish
end
