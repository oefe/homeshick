# This script should be sourced in the context of your shell like so:
# source $HOME/.homesick/repos/homeshick/homeshick.fish
# Alternatively, it can be installed into one of the directories
# that fish uses to autoload functions (e.g ~/.config/fish/functions)
# Once the homeshick() function is defined, you can type
# "homeshick cd CASTLE" to enter a castle.

function homeshick
	if test \( (count $argv) = 2 -a "$argv[1]" = "cd" \)
		cd "$HOME/.homesick/repos/$argv[2]"
	else if set -q HOMESHICK_DIR
		eval $HOMESHICK_DIR/bin/homeshick (string escape -- $argv)
	else if set homeshick (type -P homeshick)
		eval $homeshick (string escape -- $argv)
	else
		eval $HOME/.homesick/repos/homeshick/bin/homeshick (string escape -- $argv)
	end
end
