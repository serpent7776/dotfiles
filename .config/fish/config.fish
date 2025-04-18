if status is-interactive
	set fish_cursor_default     block
	set fish_cursor_insert      block
	set fish_cursor_replace_one underscore
	set fish_cursor_visual      block

	# One of these is alt+backspace.
	bind --mode insert \e\x7f backward-kill-word
	bind --mode insert \e\b backward-kill-word

	bind --mode insert \ca beginning-of-line
	bind --mode insert \ce end-of-line

	bind --mode insert \cf forward-char
	bind --mode insert \cb backward-char

	bind --mode insert \ct transpose-chars
	bind --mode insert \et transpose-words

	bind --mode insert \cp up-or-search
	bind --mode insert \cn down-or-search

	bind --mode insert \cr history-pager

	alias poly 'rlwrap poly'
	alias ocaml 'rlwrap ocaml'
	alias tclsh 'rlwrap tclsh'
	alias ngnk 'rlwrap -S "> " -pgreen ngnk /usr/lib/ngnk/repl.k'
	alias R 'R --no-save'
	alias view 'vim -R'
	alias utop 'opam exec --switch=repl -- utop'

	. ~/data/git/cg/activate.fish

	set -gx LESS "-R -M --incsearch --shift=8 --use-color"
	set -gx PAGER "less -R"
	set fish_help_browser midori

	fish_add_path ~/.cargo/bin/
end
