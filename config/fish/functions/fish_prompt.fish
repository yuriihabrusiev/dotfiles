function fish_prompt
  set -l return_code $status
  set -l uid (id -u $USER)
  set -l current_dir (pwd)

  if test $current_dir != $HOME
    set_color cyan
    echo -n (basename $current_dir)
    set_color normal
    echo -n (__fish_git_prompt '(%s)')
    echo -n ' '
  end
  set_color normal

  if test $return_code -eq 0
    set_color green
  else
    set_color red
  end
  if [ $uid -eq 0 ]
    echo -n '# '
  else
    echo -n '$ '
  end
  set_color normal
end
