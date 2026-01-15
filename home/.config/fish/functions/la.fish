function la --wraps=ls --wraps='eza --long --all --git' --description 'alias la=eza --long --all --git'
  eza --long --all --git $argv
end
