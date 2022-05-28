# customize user paths
set --global SSH_AUTH_SOCK (realpath ~/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh)
set --global fish_user_paths ~/bin (realpath $OMF_CONFIG/../../bin) ~/.mint/bin ~/Library/Android/sdk/platform-tools/ ~/.fastlane/bin /usr/local/sbin /Volumes/External/Developer/Android/sdk/platform-tools

set --global theme_display_ruby no
set --global theme_color_scheme terminal
set --global theme_nerd_fonts yes

# Java
set --global JAVA_HOME (/usr/libexec/java_home)
# Android
set --global ANDROID_SDK_ROOT /Volumes/External/Developer/Android/sdk/

# aliases
alias ls='exa'
alias unfuckxcode='rm -rf ~/Library/Developer/Xcode/DerivedData/ModuleCache.noindex; rm -rf ~/Library/Developer/Xcode/DerivedData/*/Build; rm -rf ~/Library/Developer/Xcode/DerivedData/*/Index; rm -rf ~/Library/Caches/com.apple.dt.Xcode; echo -e "\xF0\x9F\x94\xA5 BURN IT ALL\xF0\x9F\x94\xA5"'

# setup asdf
set --global ASDF_DIR (brew --prefix asdf)
source "$ASDF_DIR/asdf.fish"

if [ -e ~/.dotfiles/local/init.fish ]
    source ~/.dotfiles/local/init.fish
end
