function unfuckxcode --description="Deletes lots of derived data folders"
  rm -rf ~/Library/Developer/Xcode/DerivedData/ModuleCache.noindex
  rm -rf ~/Library/Developer/Xcode/DerivedData/*/Build
  rm -rf ~/Library/Developer/Xcode/DerivedData/*/Index
  rm -rf ~/Library/Caches/com.apple.dt.Xcode
  echo -e "\xF0\x9F\x94\xA5 BURN IT ALL\xF0\x9F\x94\xA5"
end
