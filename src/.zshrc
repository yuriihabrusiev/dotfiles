# oh-my-zsh https://github.com/ohmyzsh/ohmyzsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.zsh"
ZSH_THEME="starship"
ENABLE_CORRECTION="true"
plugins=(direnv rbenv)
source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=en_US.UTF-8
export VISUAL=nova
export EDITOR=vim
export BUNDLER_EDITOR="nova --no-recent"

eval "$(gh completion --shell zsh)"
# eval "$(nodenv init -)"

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f "$HOME/.netlify/helper/path.zsh.inc" ]; then
  source "$HOME/.netlify/helper/path.zsh.inc"
fi

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey -M emacs "$terminfo[kcuu1]" history-substring-search-up
bindkey -M emacs "$terminfo[kcud1]" history-substring-search-down
