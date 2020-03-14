# adapted from https://gist.github.com/codeOfRobin/1a22fb0fd962d8eac0b6410d8c1004cb
function clapify --description 'Replaces words with claps a la https://handclaps.io'
  string join ' 👏 ' $argv | pbcopy
  pbpaste
end