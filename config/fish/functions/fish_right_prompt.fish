function fish_right_prompt
	set -l current_dir (pwd)

	if test $current_dir != $HOME
		set_color cyan
		echo (prompt_pwd)
	else
		set_color blue
		echo -n "$USER"
		set_color normal
		echo -n "@"
		set_color blue
		echo -n (hostname -s)
	end
	set_color normal
end
