#!/bin/sh

pp() {
	# remember output, prevent different clipboard contents
	# after choosing to execute
	script=$(xclip -o)
	cat -A <<< "$script"
	printf "\nExecute? (y/n): "
	read execute
	# only execute when 'y' was answered
	# all other input is ignored
	if [[ "y" == "$execute" ]]; then
		eval "$script"
	fi
}
