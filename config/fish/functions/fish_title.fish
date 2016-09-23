function fish_title
	set -l basename (command basename $PWD)
	set -l current_folder (prompt_pwd)
	set -l command $argv[1]
	set -l prompt "$basename: $command - $_"

	if test "$command" -eq ""
		set prompt "$current_folder - $_"
	end

	echo $prompt
end
