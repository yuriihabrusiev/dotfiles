set -x LANG en_US.UTF-8
set -x EDITOR atom
set -x VISUAL atom
set -x PATH ~/.bin $PATH
status --is-interactive; and . (rbenv init -|psub)
