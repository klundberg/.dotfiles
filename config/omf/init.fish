# setup rbenv
status --is-interactive; and source (rbenv init -|psub)

# customize user paths
set --global fish_user_paths ~/bin (realpath $OMF_CONFIG/../../bin) ~/Library/Python/3.7/bin ~/.fastlane/bin

# aliases
alias ls='ls -G'
alias unfuckxcode='rm -rf ~/Library/Developer/Xcode/DerivedData; rm -rf ~/Library/Caches/com.apple.dt.Xcode; echo -e "\xF0\x9F\x94\xA5 BURN IT ALL\xF0\x9F\x94\xA5"'

# setup asdf
source (brew --prefix asdf)"/asdf.fish"
