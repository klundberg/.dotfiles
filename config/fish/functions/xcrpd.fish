# Defined in - @ line 1
function xcrpd --wraps='xcodebuild -resolvePackageDependencies' --description 'alias xcrpd=xcodebuild -resolvePackageDependencies'
  xcodebuild -resolvePackageDependencies $argv;
end
