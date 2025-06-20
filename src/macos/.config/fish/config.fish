/opt/homebrew/bin/brew shellenv fish | source
abbr bup "brew upgrade"
abbr bbi "brew bundle install --global"
abbr bbc "brew bundle cleanup --global"

# Google Cloud SDK
if test -f '/opt/homebrew/share/google-cloud-sdk/path.fish.inc'
    source '/opt/homebrew/share/google-cloud-sdk/path.fish.inc'
end

# Enable shell command completion for gcloud
if test -f '/opt/homebrew/share/google-cloud-sdk/completion.fish.inc'
    source '/opt/homebrew/share/google-cloud-sdk/completion.fish.inc'
end

if status is-interactive
    set -gx EDITOR "zed --wait"
    atuin init fish | source
    zoxide init --cmd cd fish | source
    starship init fish | source
end
