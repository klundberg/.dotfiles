#!/bin/bash
# shellcheck source=/dev/null

eval "$(brew shellenv)"

if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . "$(brew --prefix)/etc/bash_completion"
fi
