source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

eval "$(direnv hook zsh)"
eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(gh completion --shell zsh)"

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/Users/yurii/.netlify/helper/path.zsh.inc' ]; then
  source '/Users/yurii/.netlify/helper/path.zsh.inc'
fi

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
