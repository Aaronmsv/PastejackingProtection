#!/bin/sh

# this is a POSIX sh compliant version of the script

pp() {
	# remember output, prevent different clipboard contents
	# after choosing to execute
	script=$(xclip -o)
	echo "$script" | cat -A
	printf "\nExecute? (y/n): "
	read execute
	# only execute when 'y' was answered
	# all other input is ignored
	if [ "y" = "$execute" ]; then
		eval "$script"
	fi
}
