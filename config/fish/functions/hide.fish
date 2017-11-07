function hide
  for path in $argv
    mv $path (dirname $path)/.(basename $path)
  end
end
