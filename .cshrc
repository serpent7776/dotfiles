alias helpcommand	man

set	filec
set	autolist = ambiguous
set	color
set	colorcat

# bindkey -v
bindkey "^W" backward-delete-word
bindkey -k up history-search-backward
bindkey -k down history-search-forward
bindkey "\e[3~" delete-char		# delete
bindkey "\e[7~" beginning-of-line	# home
bindkey "\e[8~" end-of-line		# end
bindkey '\e[1;5C' forward-word		# ctrl right
bindkey '\e[1;5D' backward-word		# ctrl left
bindkey "^[," backward-word		# Alt-,
bindkey "^[." forward-word		# Alt-.
bindkey "^R" i-search-back
bindkey -b M-g list-glob
bindkey -b M-x newline-and-hold
bindkey -s -b M-r "rehash\n"
bindkey -s -b M-p " | $PAGER"