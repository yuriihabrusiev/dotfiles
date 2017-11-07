function fish_prompt
  set -l return_code $status
  set -l uid (id -u $USER)
  set -l current_dir (pwd)

  if test $current_dir != $HOME
    set_color cyan
    echo -n (basename $current_dir)
    echo -n ' '
  end
  set_color normal

  if test $return_code -ne 0
    set_color red
    echo -n "• "
  end

  if test $uid -eq 0
    set_color red
  else
    set_color magenta
  end
  echo -n '→ '
  set_color normal
end
