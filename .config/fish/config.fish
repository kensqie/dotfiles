set fish_greeting ""

if type nvim > /dev/null 2>&1
	set -gx VISUAL nvim
	set -gx EDITOR nvim
end

source (dirname (status --current-filename))/aliases.fish
source (dirname (status --current-filename))/colors.fish
