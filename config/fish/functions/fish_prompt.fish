function fish_prompt --description 'Write out the prompt'
	set -l color_cwd
	set -l suffix
	set -l color_suffix

	switch $USER
	case root toor
		if set -q fish_color_cwd_root
			set color_cwd $fish_color_cwd_root
		else
			set color_cwd $fish_color_cwd
		end
		set suffix '# '
	case '*'
		set color_cwd $fish_color_cwd
		set suffix '❯ '
	end

	if test $status -ne 0
		set color_suffix red
	else
		set color_suffix magenta
	end

	echo ''
	echo -s (set_color $color_cwd) (prompt_pwd) (set_color normal) (__fish_git_prompt)
	echo -s (set_color $color_suffix) $suffix (set_color normal)
end
