export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

#History setup
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZ

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #enable approximate matches for completion
autoload -Uz compinit; compinit -i

# fpath+=("$HOME/.zsh")

autoload -U promptinit; promptinit
if type -f prompt_pure_setup > /dev/null; then
  prompt pure
else
  autoload -Uz vcs_info
  precmd_vcs_info() { vcs_info }
  precmd_functions+=( precmd_vcs_info )
  setopt prompt_subst
  zstyle ':vcs_info:git:*' formats '(%F{blue}%b%f)'
  zstyle ':vcs_info:*' enable git

  export PROMPT='%F{blue}%c%f ❯ '
  export RPROMPT=\$vcs_info_msg_0_
fi

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(nodenv init -)"

eval "$(pipenv --completion)"
eval "$(gh completion --shell zsh)"

[[ -f ~/.aliases ]] && source ~/.aliases

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/Users/yurii/.netlify/helper/path.zsh.inc' ]; then source '/Users/yurii/.netlify/helper/path.zsh.inc'; fi
