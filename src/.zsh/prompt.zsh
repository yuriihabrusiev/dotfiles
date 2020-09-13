autoload -U promptinit
promptinit

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
