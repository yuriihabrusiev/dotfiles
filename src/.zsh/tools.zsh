eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(gh completion --shell zsh)"

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/Users/yurii/.netlify/helper/path.zsh.inc' ]; then
  source '/Users/yurii/.netlify/helper/path.zsh.inc'
fi
