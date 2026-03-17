# Aliases
alias ls="ls -CF -v --color=auto --group-directories-first"
alias ll="ls -l1h"
alias la="ll -A"

# Environment
export VISUAL=vim
export EDITOR=$VISUAL
export HISTCONTROL="ignoreboth:erasedups"
export HISTIGNORE="&:cls:ls:la:ll:lt:ps:logs:cd:home:pwd:[bf]g:exit"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# Options
shopt -s histappend
shopt -s autocd
shopt -s checkjobs
shopt -s cmdhist
shopt -s checkwinsize

HISTSIZE=1000
PROMPT_DIRTRIM=3
PROMPT_COMMAND="history -a${PROMPT_COMMAND:+;$PROMPT_COMMAND}"

# Colors
black="\e[1;30m";
red="\e[1;31m";
green="\e[1;32m";
yellow="\e[1;33m";
blue="\e[1;34m";
purple="\e[1;35m";
cyan="\e[1;36m";
white="\e[1;37m";
bright_black="\e[1;90m";
bright_red="\e[1;91m";
bright_green="\e[1;92m";
bright_yellow="\e[1;93m";
bright_blue="\e[1;94m";
bright_purple="\e[1;95m";
bright_cyan="\e[1;96m";
bright_white="\e[1;97m";

# Functions
mcd () {
	mkdir -p -- "$1" && cd -P -- "$1";
}

up() {
	cd $(eval printf "../"%.0s {1..$1});
}

git_branch() {
	git rev-parse --is-inside-work-tree &>/dev/null || return
	[ "$(git rev-parse --is-inside-git-dir 2>/dev/null)" != "true" ] || return

	git update-index --really-refresh -q &>/dev/null

	local s="" branch
	git diff --cached --quiet --ignore-submodules || s+='+'
	git diff --quiet --ignore-submodules || s+='!'
	[ -n "$(git ls-files --others --exclude-standard)" ] && s+='?'
	git rev-parse --verify refs/stash &>/dev/null && s+='$'

	branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null || echo '(unknown)')
	[ -n "$s" ] && s="[$s]"

	printf " %s%s" "$1" "$branch$s"
}

add_to_path() {
	case ":$PATH:" in
		*":$1:"*) ;;
		*) PATH="$PATH:$1" ;;
	esac
}

# Path
add_to_path "$HOME/.local/bin"

# Prompt string
PS1="\[$blue\]\w"
PS1+='$(if git rev-parse --git-dir >/dev/null 2>&1; then echo "\['"$yellow"'\]$(git_branch)"; fi)'
PS1+="\[$(tput sgr0)\] "
