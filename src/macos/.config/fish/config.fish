/opt/homebrew/bin/brew shellenv fish | source
abbr bup "brew upgrade"
abbr bbi "brew bundle install --global"
abbr bbc "brew bundle cleanup --global"

fish_add_path -m $HOME/.local/bin

if status is-interactive
  set -gx EDITOR "code --wait"

  starship init fish | source
end
