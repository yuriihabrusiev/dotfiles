function fish_prompt --description 'Write out the prompt'
	set -l color_cwd

	switch $USER
	case root toor
		set color_cwd $fish_color_cwd_root
	case '*'
		set color_cwd $fish_color_cwd
	end

	echo ''
	echo -s (set_color $color_cwd) (prompt_pwd) (set_color normal) (__fish_git_prompt) ' '
end
