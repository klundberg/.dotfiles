# Defined via `source`
function bef --wraps='bundle exec fastlane' --description 'alias bef=bundle exec fastlane'
  bundle exec fastlane $argv; 
end
