function fish_right_prompt
	set -l current_dir (pwd)

	if test (command git rev-parse --is-inside-work-tree ^/dev/null)
		echo -n (__fish_git_prompt '(%s)')
	else if test $current_dir != $HOME
		set_color cyan
		echo (prompt_pwd)
	else
		set_color blue
		echo -n "$USER"
		set_color normal
		echo -n "@"
		set_color blue
		echo -n (prompt_hostname)
	end
	set_color normal
end
