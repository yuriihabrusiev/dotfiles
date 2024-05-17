if type brew &>/dev/null; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

local_functions="$HOME/.local/share/zsh/site-functions"
if [[ -z ${fpath[(r)$local_functions]} ]] ; then
  fpath=($local_functions $fpath)
  autoload -Uz ${local_functions}/*(:t)
fi

if [ -d "$HOME/.local/bin" ]; then
  path=($HOME/.local/bin $path)
fi

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

export HISTSIZE=10000
export SAVEHIST=10000
setopt append_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history

setopt auto_cd

if [ -d "$HOME/.bun" ]; then
  [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

if command -v fnm &> /dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

[ -d $HOME/.local/share/gh/extensions/gh-copilot ] && eval "$(gh copilot alias -- zsh)"

eval "$(mise activate)"

if command -v starship &> /dev/null; then
  [ $TERM_PROGRAM = "WarpTerminal" ] && export STARSHIP_CONFIG=$HOME/.config/starship-warp.toml
  eval "$(starship init zsh)"
fi
