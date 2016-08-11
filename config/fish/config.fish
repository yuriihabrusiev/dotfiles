set -x LANG en_US.UTF-8
set -x EDITOR atom
set -x VISUAL atom
set -x PATH ~/.bin $PATH
status --is-interactive; and . (rbenv init -|psub)

set __fish_git_prompt_showcolorhints yes
set __fish_git_prompt_showdirtystate yes
# set __fish_git_prompt_showstashstate yes
# set __fish_git_prompt_showuntrackedfiles yes
# set __fish_git_prompt_showupstream auto verbose name
# set __fish_git_prompt_show_informative_status yes
