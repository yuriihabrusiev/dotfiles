[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

eval "$(direnv hook bash)"
eval "$(rbenv init -)"
# Python tools
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pipenv --completion)"

alias ll='ls -l'

export PATH=~/.bin:$PATH
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR="atom --wait"
export GIT_PS1_SHOWDIRTYSTATE=1
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export PS1="\[\e[0;32m\]\W\[\e[m\]\[\e[0;33m\]\$(__git_ps1)\[\e[m\] \\$ "
