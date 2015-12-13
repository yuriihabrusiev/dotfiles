# History
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

if command -v rbenv >/dev/null; then
  eval "$(rbenv init - --no-rehash)"
fi

# awesome cd
setopt autocd auto_pushd pushd_minus pushd_silent pushd_ignore_dups pushd_to_home cdable_vars
DIRSTACKSIZE=5

# colors
autoload -U colors && colors
export CLICOLOR=1

# completion
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit
setopt complete_in_word always_to_end correct
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "%{$fg[yellow]%}-- %d --%{$reset_color%}"
zstyle ':completion:*:messages' format "%{$fg[green]%}-- %d --%{$reset_color%}"
zstyle ':completion:*:warnings' format 'No matches.'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

autoload -U select-word-style && select-word-style bash

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# prompt
setopt prompt_subst
autoload -U promptinit && promptinit
prompt pure

# Zsh Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Z
source `brew --prefix`/etc/profile.d/z.sh

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

export -U PATH
