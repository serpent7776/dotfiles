bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias j=jobs
alias m=$PAGER
alias ll='ls -laFo'
alias view='vim -R'

export EDITOR=vim
export PAGER=less
export LANG=en_GB.UTF-8
export LC_MESSAGES=en_GB.UTF-8

,pgdb() {
	pname="$1"
	for i in $(seq 1000); do
		if pgrep "$pname"; then
			gdb -p $(pgrep "$pname")
			break
		fi
	done
}
