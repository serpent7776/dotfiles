" ui
set guioptions+=t
set guioptions-=T

" displaying text
set guifont=DejaVu\ Sans\ Mono\ 10
set bsdir=buffer
set ruler
set shortmess=filmnrx
set statusline=%n:\ %M%f%3.(\ %)%([%Y%R]%)%=%(%l/%LL,%cC\ %P%)
set winaltkeys=no

"Plugins:
"Mark:
let g:mwDefaultHighlightingPalette = 'extended'
"VMark:
let g:vm_guifg = 'white'
let g:vm_guibg = 'blue'
"Airline:
let g:airline_left_sep='▶'
let g:airline_right_sep='◀'
let g:airline_powerline_fonts=0

"Menus:
menu ]MyMenu.Plugin.Enable\ IndentTab	:call IndentTab#Set(1, 0)<CR>
menu ]MyMenu.Plugin.Syntastic\ disable\ auto\ loclist	:let g:syntastic_auto_loc_list = 0<CR>
menu ]MyMenu.Plugin.Syntastic\ enable\ auto\ loclist	:let g:syntastic_auto_loc_list = 1<CR>
menu ]MyMenu.External.cppcheck\ current\ file	:!cppcheck --enable=all %<CR>

"Mappings:
map <F12> :popup ]MyMenu<CR>
