config_files=($HOME/.zsh/*.zsh)

for config in ${${config_files:#*/completion.zsh}:#*/tools.zsh}; do
  source $config
done

for config in ${(M)config_files:#*/completion.zsh}; do
  source $config
done

for config in ${(M)config_files:#*/tools.zsh}; do
  source $config
done

[[ -f ~/.aliases ]] && source ~/.aliases
