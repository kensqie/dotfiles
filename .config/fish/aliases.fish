alias ls="ls -CF -v --color=auto --group-directories-first"

if type eza > /dev/null 2>&1
	alias ls="eza --group-directories-first"
	alias ll="ls -l"
	alias la="ll -a"
	alias lt='ls -T'
end

