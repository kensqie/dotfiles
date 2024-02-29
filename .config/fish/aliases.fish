alias ls="ls -CF -v --color=auto --group-directories-first"

if type eza > /dev/null 2>&1
	alias lt="eza --group-directories-first -T"
	alias ll="eza --group-directories-first -l"
	alias la="ll -a"
end
