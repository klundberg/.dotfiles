function unfuckxcode --description="Deletes lots of derived data folders"
  rm -rf "$HOME/Library/Developer/Xcode/DerivedData/ModuleCache.noindex"
  rm -rf "$HOME/Library/Developer/Xcode/DerivedData/*/Build"
  rm -rf "$HOME/Library/Developer/Xcode/DerivedData/*/Index"
  rm -rf "$HOME/Library/Caches/com.apple.dt.Xcode"
  rm -rf "$HOME/Library/Caches/org.swift.swiftpm"
  echo -e "\xF0\x9F\x94\xA5 BURN IT ALL\xF0\x9F\x94\xA5"
end
