# PATH
add_to_path() {
	case ":$PATH:" in
		*":$1:"*) ;;
		*) PATH="$1:$PATH" ;;
	esac
}

add_to_path "$HOME/.local/bin"

# Editor
export VISUAL=vim
export EDITOR=$VISUAL

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt histignoredups sharehistory appendhistory histappend incappendhistory

# Aliases
alias ls="ls -CF -v --color=auto --group-directories-first"
alias ll="ls -lh"
alias la="ls -lhA"

# Options
setopt correct notify extendedglob

# Completion
autoload -Uz compinit; compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' squeeze-slashes true

# Colors
autoload -U colors && colors
for c in black red green yellow blue magenta cyan white; do
	eval "$c='%{$fg[$c]%}'"
	eval "bright_$c='%{$fg_bold[$c]%}'"
done

# Functions
mcd() { mkdir -p -- "$1" && cd -P -- "$1"; }

up() { for ((i=0;i<$1;i++)); do cd ..; done }

git_branch() {
	git rev-parse --is-inside-work-tree &>/dev/null || return
	[ "$(git rev-parse --is-inside-git-dir 2>/dev/null)" != "true" ] || return

	local s="" branch
	git diff --cached --quiet --ignore-submodules 2>/dev/null || s+='+'
	git diff --quiet --ignore-submodules 2>/dev/null || s+='!'
	[ -n "$(git status --porcelain 2>/dev/null)" ] && s+='?'
	git rev-parse --verify refs/stash &>/dev/null && s+='$'

	branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null || echo '(unknown)')
	[[ -n "$s" ]] && s="[$s]"
	printf " %s%s" "$1" "$branch$s"
}

# Prompt
autoload -Uz promptinit; promptinit
setopt PROMPT_SUBST
PROMPT='%{$fg_bold[blue]%}%3~%{$reset_color%}$(if [[ -z $COMP_LINE ]]; then git rev-parse --is-inside-work-tree &>/dev/null && echo "%{$fg_bold[yellow]%}$(git_branch)%{$reset_color%}"; fi) '
