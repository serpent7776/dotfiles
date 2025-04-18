set nocompatible
if !exists("g:nobundles")
	call plug#begin()

	Plug 'ciaranm/securemodelines'
	Plug 'vim-scripts/LargeFile'
	Plug 'Yggdroot/LeaderF'
	Plug 'cohama/lexima.vim'
	Plug 'bkad/CamelCaseMotion'
	Plug 'junegunn/vim-easy-align'
	Plug 'sbdchd/neoformat'
	Plug 'michaelzhou999/vmark'
	Plug 'inkarkat/vim-ingo-library'
	Plug 'inkarkat/vim-mark'
	" Plug 'tomtom/tcomment_vim'
	Plug 'rking/ag.vim'
	Plug 'scrooloose/nerdcommenter'
	Plug 'w0rp/ale'
	Plug 't9md/vim-textmanip'
	Plug 'tommcdo/vim-exchange'
	Plug 'tmhedberg/matchit'
	Plug 'kien/rainbow_parentheses.vim'
	Plug 'tpope/vim-surround'
	Plug 'AndrewRadev/splitjoin.vim'
	Plug 'jsborjesson/vim-uppercase-sql'
	Plug 'tpope/vim-fugitive'
	Plug 'gregsexton/gitv'
	Plug 'tpope/vim-capslock'
	Plug 'tpope/vim-eunuch'
	Plug 'tpope/tpope-vim-abolish'
	Plug 'xolox/vim-misc'
	Plug 'serpent7776/RedirCommands'
	Plug 'vbextreme/dumpx'
	Plug 'mhinz/vim-signify'
	Plug 'Shougo/vimproc.vim'
	Plug 'joonty/vdebug'
	Plug 'Konfekt/FastFold'
	Plug 'ycm-core/YouCompleteMe'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'serpent7776/my-snippets'
	Plug 'mbbill/undotree'
	Plug 'szw/vim-maximizer'
	Plug 'mlochbaum/BQN', {'rtp': 'editors/vim'}
	Plug 'https://codeberg.org/ngn/k', {'rtp': 'vim-k'}
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'gauteh/vim-cppman'
	Plug 'tikhomirov/vim-glsl'
	Plug 'nickhutchinson/vim-cmake-syntax'
	Plug 'NoahTheDuke/vim-just'
	Plug 'serpent7776/vim-pglog-syntax'
	" Plug 'kelwin/vim-smali'
	" Plug 'serpent7776/vim-logcat'
	Plug 'vim-scripts/brainfuck-syntax'
	" Plug 'jszakmeister/vim-togglecursor'
	Plug 'ledger/vim-ledger'
	Plug 'serpent7776/vim-vish'
	Plug 'github/copilot.vim'
	if has('nvim')
		Plug 'nvim-lua/plenary.nvim' " required by copilot chat
		Plug 'CopilotC-Nvim/CopilotChat.nvim'
	endif

	call plug#end()
endif

if has('nvim')
	lua require("CopilotChat").setup()
endif

let g:copilot_filetypes = {
			\ '*': v:false,
			\ }
let g:copilot_no_tab_map = v:true
inoremap <C-\> <Plug>(copilot-suggest)
inoremap <silent><script><expr> <Tab> copilot#Accept("")
inoremap <silent><script><expr> <A-Right> copilot#AcceptWord("")
inoremap <silent><script><expr> <C-Right> copilot#AcceptLine("")

function! ListFKeyMaps()
	let g:maps = ''
	for i in range(1, 12)
		redir =>> g:maps
			silent execute 'map <F'.i.'>'
		redir END
	endfor

	let l:lines = split(g:maps, '\n')
	call filter(l:lines, 'v:val != ""')
	call filter(l:lines, 'v:val != "No mapping found"')
	echo join(l:lines, "\n")
endfunction

function! ReverseLines(first, last)
    let l:anchor = a:first-1
    execute a:first.",".a:last."g/^/m".l:anchor
endfunction

"security
set nomodeline

"reading files
set autoread
"writing files
set updatecount=250
set updatetime=7500
set encoding=utf-8

"syntax, highlighting and ui
set rnu
set nu
set bg=dark
set cursorline
set hlsearch
set laststatus=2 " show statusbar
set showcmd
set showmode
set diffopt+=algorithm:patience,indent-heuristic
set ruler
set noequalalways
colo vish

"displaying text
set numberwidth=4
set lbr
set list
set listchars=tab:¦\ ,trail:·
set display=lastline
set statusline=%{tabpagewinnr(tabpagenr())}w,%nb:\ %M%f%3.(\ %)%([%Y%R]%)\ \"%{v:register}\ %=%(%l/%LL,%cC\ %P%)
set shortmess-=S

"formatting text
set formatoptions +=rj
set formatoptions -=o
set cinoptions=g0,t0,j1,l1,(s,W1s,m1
set ai

"completion
if has ('nvim')
	set completeopt=menu,preview,longest
else
	set completeopt=menu,preview,longest,popup
endif

"folds
set foldmethod=marker

"filesystem
set wildmode=longest,list
set autochdir
set sessionoptions=blank,buffers,folds,resize,sesdir,tabpages,winpos,winsize
set suffixesadd=h,cfg,rb
set tags=./tags;/

"searching and moving
set ignorecase
set incsearch
set virtualedit=block

"other
syntax on
filetype plugin indent on
set spelllang=en,pl

"ft options:
let omni_sql_no_default_maps=1

"plugin configuration
"NetRW:
let g:netrw_browsex_viewer="firefox"
"NerdCommenter:
let g:NERDSpaceDelims = 1
"Checksyntax:
let g:checksyntax_enable_syntax=[]
let g:checksyntax_auto = 0	" disable auto-check
let g:checksyntax#auto_mode = 0	" disable auto-check
let g:checksyntax#async_runner = ""	" disable async commands
"ConqueTerm:
let g:ConqueTerm_TERM = 'xterm'
"Mark:
let g:mwDefaultHighlightingPalette = 'extended'
" let g:mwDefaultHighlightingNum = 9
let g:mwHistAdd = ''
let g:mwAutoLoadMarks = 0
let g:mwAutoSaveMarks = 0
let g:mwIgnoreCase = 0
"Xml:
let g:xml_use_xhtml = 1
let g:makeElementSuf = '<>'
"VMark:
let g:vm_ctermfg = 'white'
let g:vm_ctermbg = 'blue'
"YouCompleteMe:
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<S-CR>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_show_diagnostics_ui = 0
let g:ycm_auto_hover=""
let g:ycm_log_level='warning'
"Notes:
let g:notes_directories = ['~/.vim/misc/notes/user']
let g:notes_shadowdir= '~/.vim/misc/notes/shadow'
let g:notes_indexfile= '~/.vim/misc/notes/index.pickle'
let g:notes_tagsidnex= '~/.vim/misc/notes/tags.txt'
"GitGutter:
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 1
"Vim_www:
let g:www_launch_browser_command = "vimb {{URL}} &"
let g:www_urls = {
     \ 'g?' : 'https://www.google.com/search?q=',
     \ }
let g:www_default_search_engine = 'g?'
"Neocomplete:
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#manual_completion_start_length = 2
let g:neocomplete#sources#syntax#min_keyword_length = 3
"LeaderF:
let g:Lf_WindowPosition='popup'
let g:Lf_PreviewPosition='right'
let g:Lf_TabpagePosition=2
let g:Lf_Ctags='ctags'
let g:Lf_WildIgnore = {
			\ 'dir': ['.svn', '.git', 'build', '.gradle', '.idea', 'libs', 'assets'],
			\ 'file': ['*.sw?', '~$*', '*.bak', '*.exe', '*.o', '*.so', '*.py[co]']
			\}
let g:Lf_ShortcutB = '<leader><S-b>'
let g:Lf_ShowDevIcons=0
let g:Lf_WorkingDirectoryMode="A"
"CommandT:
let g:CommandTFileScanner = 'git'
let g:CommandTGitScanSubmodules = 1
" let g:CommandTWildIgnore = &wildignore . ''
"CamelCaseMotion:
call camelcasemotion#CreateMotionMappings(',')
"Shell:
let g:shell_mappings_enabled = 0
"UltiSnips:
let g:UltiSnipsEditSplit="context"
"Ale:
let g:ale_completion_enabled=1
let g:ale_floating_preview=1
let g:ale_virtualtext_cursor=0 " disable virtual text
let g:ale_nasm_nasm_options='-f elf64'
let g:ale_cpp_cc_options="-std=c++20 -Wall -Wextra -pedantic -I /usr/local/include"
let g:ale_cpp_clangtidy_options="-std=c++20 -I /usr/local/include"
let g:ale_cpp_clangcheck_options='--extra-arg=-std=c++20'
let g:ale_sql_sqlfluff_options="--dialect postgres"
let g:ale_r_lintr_options="with_defaults(line_length_linter(length = 120))"
let g:ale_linters={
			\ 'javascript': [],
			\ 'cpp': ['clang', 'clangtidy', 'clangcheck', 'gcc'],
			\ 'rust': ['rls', 'cargo', 'rustc', 'analyzer'],
			\}
"VimLSP:
let g:lsp_signature_help_enabled = 0
let g:lsp_diagnostics_virtual_text_enabled=0 " disable virtual text
let g:lsp_diagnostics_echo_cursor=1
let g:lsp_diagnostics_echo_delay=1000
let g:lsp_document_highlight_enabled=0
"Ag:
let g:ag_highlight=1
let g:ag_mapping_message=0
let g:ag_working_path_mode='r'
"SplitJoin:
let g:splitjoin_split_mapping = 'cK'
let g:splitjoin_join_mapping = 'cJ'
let g:splitjoin_mapping_fallback = 0
let g:splitjoin_quiet = 1
"Rainbow_parentheses:
let g:rbpt_colorpairs = [
	\ ['gray',        'RoyalBlue3'],
	\ ['darkgray',    'DarkOrchid3'],
	\ ['white',       'SeaGreen3'],
	\ ['brown',       'RoyalBlue3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'SeaGreen3'],
	\ ['darkgreen',   'firebrick3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['darkred',     'SeaGreen3'],
	\ ['red',         'firebrick3'],
	\ ['brown',       'firebrick3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['Darkblue',    'firebrick3'],
	\ ['darkgreen',   'RoyalBlue3'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['darkred',     'DarkOrchid3'],
	\ ['red',         'firebrick3'],
	\ ]

function! DDgr(args)
	if a:args == ""
		let l:query = expand('<cword>')
	else
		let l:query = a:args
	endif
	if has('gui')
		execute 'tab terminal env BROWSER=w3m ddgr ' . shellescape(l:query)
	else
		execute '!' 'env BROWSER=w3m ddgr ' . shellescape(l:query)
	endif
endfunction


"Commands:
" Open file in a new tab
command! -nargs=1 -complete=file E	tabe <args>
" search for a pattern in current file and put results in location list
command! -nargs=1 G	lvimgrep /<args>/j % <bar> lop
command! TrimSpaces :keeppatterns %s/\s\+$//e
command! F :call ListFKeyMaps()
command! W : " disable Eunuch W command
command! -range Rev :call ReverseLines(<line1>, <line2>)
command! Scratch :new | setlocal buftype=nofile bufhidden=hide noswapfile | file "[Scratch]"
command! -nargs=? DD :call DDgr(<q-args>)

"Mappings:
" get rid of annoying neovim mapping
silent! unmap Y

"misc:
noremap Q :
noremap ,; :
nnoremap [o O<ESC>
nnoremap ]o o<ESC>
nmap \M<space> :QuickhlMatch<LF>
nmap \Mc :QuickhlMatchClear<LF>
nmap <c-w>; :exe 'resize '.line('$')<LF>
nnoremap <C-W>m :MaximizerToggle<CR>
imap <S-Tab> 
imap <C-Tab> <C-T>
imap <A-a> <C-o>A
imap <A-;> <C-o>A;
imap <A--> _
imap <A-=> +
imap <A-7> &
imap <A-8> *
imap <A-9> (
imap <A-0> )

"movement:
noremap ,, ,
nmap [b ?[({[]<LF>:nohl<LF>
nmap ]b /[({[]<LF>:nohl<LF>
nmap [B ?[)}\]]<LF>:nohl<LF>
nmap ]B /[)}\]]<LF>:nohl<LF>
nmap <S-Up> gk
nmap <S-Down> gj
vmap <S-Up> gk
vmap <S-Down> gj
imap <S-Up> gk
imap <S-Down> gj
nmap <C-Up> 5k
vmap <C-Up> 5k
imap <C-Up> 5k
nmap <C-Down> 5j
vmap <C-Down> 5j
imap <C-Down> 5j
map <Space>j 5j
map <Space>k 5k
map <Home> ^
map [l :lprevious<LF>
map ]l :lnext<LF>

"scrolling:
nmap ,j 7
vmap ,j 7
nmap ,k 7
vmap ,k 7
nmap <M-Up> 
vmap <M-Up> 
imap <M-Up> 
nmap <M-Down> 
vmap <M-Down> 
imap <M-Down> 

"yank and paste:
nmap \y "+yy
nmap \d "+dd
nmap \p "+p
nmap \P "+P
vmap \y "+y
vmap \d "+d
vmap \p "+p
vmap \P "+P
imap <S-Insert> <C-R>*
nmap ,p ]o\p
if !has('nvim')
	set pastetoggle=<F12>
endif

"buffers:
nnoremap <C-n> :vnew<LF>
nnoremap \q :bd<LF>
nnoremap ,q :q<LF>

"tabs:
nnoremap gr gT
nnoremap <C-K> gt
nnoremap <C-J> gT
nnoremap \t :tabs<LF>
nmap <C-Insert> :tabnew<LF>
map <A-1> :tabn 1<LF>
map <A-2> :tabn 2<LF>
map <A-3> :tabn 3<LF>
map <A-4> :tabn 4<LF>
map <A-5> :tabn 5<LF>
map <A-6> :tabn 6<LF>
map <A-7> :tabn 7<LF>
map <A-8> :tabn 8<LF>
map <A-9> :tabn 9<LF>
map <A-0> :tabn 10<LF>
map <C-Home> :tabfirst<LF>
map <C-End> :tablast<LF>
nmap g< :tabm -1<LF>
nmap g> :tabm +1<LF>
map <A-Left> :tabm -1<LF>
map <A-Right> :tabm +1<LF>
map <A-Home> :tabm 0<LF>
map <A-End> :tabm 100<LF>

"jumping buffers/tags/lines:
nmap <A-b> :LeaderfBuffer<LF>
nmap \F :LeaderfFunction<LF>
nmap \gf :LeaderfFilePattern<Space>
nmap \gF :LeaderfFileCword<LF>
nmap \gl :LeaderfLineCword<LF>
nmap \gL :LeaderfLinePattern<Space>
nmap \gr :LeaderfTagPattern<Space>
nmap \gw :LeaderfTagCword<LF>
nmap \gb :LeaderfBuffer<LF>

"searching and highlighting
nmap <C-l> :noh<LF>:diffupdate<LF>:SignifyRefresh<LF>:redraw!<LF>
nmap ]<space> /\s\+$<LF>
nmap [<space> ?\s\+$<LF>
nmap ,mm <Plug>VMarkToggle
nmap ,mn <Plug>VMarkNext
nmap ,mN <Plug>VMarkPrevious
nmap ,mc <Plug>VMarkClearAll
nmap g/ :set hlsearch<LF>:let @/="\\<" . expand('<cword>') . "\\>"<LF>
nmap <Space>m, <Plug>MarkSet
nmap <Space>mm <Plug>MarkSet
nmap <Space>mr <Plug>MarkRegex
nmap <Space>mn <Plug>MarkSearchCurrentNext
nmap <Space>mN <Plug>MarkSearchCurrentPrev
nmap <Space>ma <Plug>MarkSearchAnyNext
nmap <Space>mc :MarkClear<LF>
nmap <Space>mi :Marks<LF>
map <C-k1> <Plug>MarkSearchGroup1Next
map <C-k2> <Plug>MarkSearchGroup2Next
map <C-k3> <Plug>MarkSearchGroup3Next
map <C-k4> <Plug>MarkSearchGroup4Next
map <C-k5> <Plug>MarkSearchGroup5Next
map <C-k6> <Plug>MarkSearchGroup6Next
map <C-k7> <Plug>MarkSearchGroup7Next
map <C-k8> <Plug>MarkSearchGroup8Next
map <C-k9> <Plug>MarkSearchGroup9Next
map <C-S-k1> <Plug>MarkSearchGroup1Prev
map <C-S-k2> <Plug>MarkSearchGroup2Prev
map <C-S-k3> <Plug>MarkSearchGroup3Prev
map <C-S-k4> <Plug>MarkSearchGroup4Prev
map <C-S-k5> <Plug>MarkSearchGroup5Prev
map <C-S-k6> <Plug>MarkSearchGroup6Prev
map <C-S-k7> <Plug>MarkSearchGroup7Prev
map <C-S-k8> <Plug>MarkSearchGroup8Prev
map <C-S-k9> <Plug>MarkSearchGroup9Prev

"selecting
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

"editing:
map \c. <Plug>NERDComInsertComment
map ]d <Plug>(textmanip-duplicate-down)
map [d <Plug>(textmanip-duplicate-up)
map <A-j> <Plug>(textmanip-move-down)
map <A-k> <Plug>(textmanip-move-up)
map <A-h> <Plug>(textmanip-move-left)
map <A-l> <Plug>(textmanip-move-right)
vmap <Enter> <Plug>(EasyAlign)
nmap ,a <Plug>(EasyAlign)
nnoremap <expr> gc '`[' . strpart(getregtype(), 0, 1) . '`]'
vmap \s :sort u<LF>

"io:
imap <A-w> :up<LF>
nmap <A-w> :up<LF>
imap <A-q> :x<LF>
nmap <A-q> :x<LF>

"changing options:
nmap ,'d :diffof<LF>
nmap ,'s :setl spell!<LF>
nmap ,'r :setl rnu!<LF>
nmap ,'n :setl nu!<LF>
nmap ,'l :setl list!<LF>

"lsp+linting:
nnoremap \ax :ALEToggle<LF>
nnoremap \ab :ALEToggleBuffer<LF>
nnoremap \ad :ALEDetail<LF>
nnoremap \ah :ALEHover<LF>
nnoremap \af :ALEGoToDefinition<LF>
nnoremap \ai :ALEGoToImplementation<LF>
nnoremap \at :ALEGoToTypeDefinition<LF>
nnoremap \aa :ALECodeAction<LF>
nnoremap \ar :ALERename<LF>
nnoremap \lx :LspStopServer<LF>
nnoremap \lh :LspHover<LF>
nnoremap \lc :LspDeclaration<LF>
nnoremap \lC :split :LspDeclaration<LF>
nnoremap \lf :LspDefinition<LF>
nnoremap \lF :split :LspDefinition<LF>
nnoremap \li :LspImplementation<LF>
nnoremap \lI :split :LspImplementation<LF>
nnoremap \lt :LspTypeDefinition<LF>
nnoremap \lT :split :LspTypeDefinition<LF>
nnoremap \lr :LspRename<LF>
nnoremap \la :LspCodeAction<LF>

"other:
nmap ,gd :Gdiff<LF>
nmap ,gc :Git commit<LF>
nmap ,gw :Gwrite<LF>
nmap ,gb :Gblame<LF>
nmap ,gs :Gstatus<LF>
imap <C-l> <Plug>CapsLockToggle
nnoremap \Sb :SignifyToggle<LF>

if has('gui_running')
	nnoremap ,tt :!xterm -e tig<LF>
	nnoremap <expr> ,tb ':!xterm -e tig blame +' . line('.') . ' ' . expand('%') . '<LF>'
	nnoremap ,tl :!xterm -e tig log %<LF>
	nnoremap ,td :!xterm -e 'git diff % \| tig'<LF>
elseif has('nvim')
	nnoremap ,tt :vsplit +terminal\ tig<LF>
	nnoremap <expr> ,tb ':vsplit +terminal\ tig\ blame\ +' . line('.') . '\ ' . expand('%') . '<LF>'
	nnoremap ,tl :vsplit +terminal\ tig\ log\ %<LF>
	nnoremap ,td :vsplit +terminal\ git\ diff\ %\ \|\ tig<LF>
else
	nnoremap ,tt :!tig<LF>
	nnoremap <expr> ,tb ':!tig blame +' . line('.') . ' ' . expand('%') . '<LF>'
	nnoremap ,tl :!tig log %<LF>
	nnoremap ,td :!git diff % \| tig<LF>
endif

"autocommands:
augroup myau
	autocmd!
	autocmd VimEnter *\(.ml\|.mli\)\@<! RainbowParenthesesLoadRound
	autocmd VimEnter *\(.ml\|.mli\)\@<! RainbowParenthesesLoadBraces
	" autocmd VimEnter *\(.ml\|.mli\)\@<! RainbowParenthesesLoadBraces
	autocmd VimEnter *\(.ml\|.mli\)\@<! RainbowParenthesesToggle
	
	" file specific options
	autocmd FileType gitcommit setlocal spell
	autocmd FileType sml setlocal ts=2 sw=2
	autocmd Syntax * RainbowParenthesesLoadRound
	" autocmd Syntax * RainbowParenthesesLoadSquare
	autocmd Syntax * RainbowParenthesesLoadBraces
	autocmd VimEnter * RainbowParenthesesToggle
augroup END
