fish_add_path ~/.local/bin
fish_add_path ~/go/bin

set -gx SHELL (which fish)
set -gx EDITOR "zed --wait"
set -gx XDG_CONFIG_HOME "$HOME/.config"

if status is-interactive
    atuin init fish --disable-up-arrow | source
    zoxide init --cmd cd fish | source
    starship init fish | source
end
