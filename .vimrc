set nocompatible
if !exists("g:nobundles")
	filetype off
	set rtp+=~/.vim/bundle/vundle/
	call vundle#begin()

	Plugin 'gmarik/vundle'
	Plugin 'ciaranm/securemodelines'
	Plugin 'LargeFile'
	Plugin 'Yggdroot/LeaderF'
	Plugin 'cohama/lexima.vim'
	Plugin 'bkad/CamelCaseMotion'
	Plugin 'junegunn/vim-easy-align'
	Plugin 'sbdchd/neoformat'
	Plugin 'michaelzhou999/vmark'
	Plugin 'inkarkat/vim-ingo-library'
	Plugin 'inkarkat/vim-mark'
	" Plugin 'tomtom/tcomment_vim'
	Plugin 'powerman/vim-plugin-viewdoc'
	Plugin 'qwertologe/nextval.vim'
	Plugin 'rking/ag.vim'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'vim-syntastic/syntastic'
	Plugin 't9md/vim-textmanip'
	Plugin 'tommcdo/vim-exchange'
	Plugin 'tmhedberg/matchit'
	Plugin 'tomtom/tlib_vim'
	Plugin 'tomtom/checksyntax_vim'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-fugitive'
	Plugin 'gregsexton/gitv'
	Plugin 'tpope/vim-capslock'
	Plugin 'tpope/vim-eunuch'
	Plugin 'tpope/tpope-vim-abolish'
	Plugin 'xolox/vim-misc'
	Plugin 'xolox/vim-shell'
	Plugin 'xolox/vim-notes'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'Shougo/vimproc.vim'
	Plugin 'joonty/vdebug'
	Plugin 'Konfekt/FastFold'
	Plugin 'Shougo/neocomplete.vim'
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'
	Plugin 'mbbill/undotree'
	" Plugin 'haya14busa/incsearch.vim'
	" Plugin 'vimspell'
	" Plugin 'waiting-for-dev/vim-www'
	Plugin 'tikhomirov/vim-glsl'
	Plugin 'nickhutchinson/vim-cmake-syntax'
	Plugin 'kelwin/vim-smali'
	Plugin 'serpent7776/vim-logcat'
	Plugin 'brainfuck-syntax'
	" Plugin 'jszakmeister/vim-togglecursor'
	Plugin 'serpent7776/vim-vish'

	call vundle#end()
endif

"security
set modeline

"writing files
"set backup
"set writebackup
set updatecount=250
set updatetime=7500
set encoding=utf-8

"syntax, highlighting and ui
set nu
set bg=dark
set cursorline
set hlsearch
set laststatus=2 " show statusbar
set showcmd
set showmode
colo vish

"displaying text
set numberwidth=4
set lbr
set list
set lcs=tab:¦\ ,trail:·
set display=lastline

"formatting text
set formatoptions +=rj
set formatoptions -=o
set cinoptions=g0,t0,j1,l1,(s,W1s,m1
set ai

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
set backspace=2
set spelllang=en,pl

"plugin configuration
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
"Syntastic:
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_c_checkers = ["gcc", "cppcheck", "splint", "clang_tidy"]
let g:syntastic_c_compiler = "clang"
let g:syntastic_c_compiler_options = "-std=c++11 -I/usr/local/include"
let g:syntastic_c_clang_tidy_exec = "clang-tidy40"
let g:syntastic_c_splint_args = "+posix-lib"
let g:syntastic_cpp_checkers = ["gcc", "cppcheck"]
let g:syntastic_cpp_compiler = "clang"
let g:syntastic_cpp_compiler_options = "-std=c++14 -I/usr/local/include"
let g:syntastic_java_checkers = ["checkstyle"]
let g:syntastic_javascript_checkers = ["jsl", "jshint"]
let g:syntastic_html_checkers = ["tidy"]
let g:syntastic_html_tidy_exec = "tidy5"
" let g:syntastic_nroff_checkers = ["igor"]
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
"Airline:
let g:airline_theme='serene'
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline#extensions#disable_rtp_load = 1
let g:airline#extensions#default#layout = [
	\ [ 'a', 'c' ],
	\ [ 'x', 'y', 'b', 'z', 'warning' ]
	\ ]
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#use_vcscommand = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#csv#enabled = 0
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#eclim#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#nrrwrgn#enabled = 0
let g:airline#extensions#capslock#enabled = 0
let g:airline#extensions#windowswap#enabled = 0
"Neocomplete:
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#manual_completion_start_length = 2
let g:neocomplete#sources#syntax#min_keyword_length = 3
" LeaderF
let g:Lf_WildIgnore = {
			\ 'dir': ['.svn', '.git', 'build', '.gradle', '.idea', 'libs', 'assets'],
			\ 'file': ['*.sw?', '~$*', '*.bak', '*.exe', '*.o', '*.so', '*.py[co]']
			\}
let g:Lf_ShortcutB = '<leader><S-b>'
let g:Lf_WorkingDirectoryMode="A"
"CommandT:
let g:CommandTFileScanner = 'git'
let g:CommandTGitScanSubmodules = 1
" let g:CommandTWildIgnore = &wildignore . ''
"CamelCaseMotion:
call camelcasemotion#CreateMotionMappings('<leader>')

"commands
command -nargs=1 -complete=file E	tabe <args>

"autocommands:

"Mappings:
"misc:
map ,; :
map \q :bd<LF>
map \o o<ESC>
map \O O<ESC>
nmap \Ss <Plug>VimchantSpellCheckSwitch
nmap \Sl <Plug>VimchantChangeLanguage
map \M<space> :QuickhlMatch<LF>
map \Mc :QuickhlMatchClear<LF>
imap <S-Tab> 
imap <C-Tab> <C-T>
imap <A-a> <C-o>A
imap <A-;> <C-o>A;
imap <A-[> <C-O>A<space>{<NL>%o
imap <A--> _
imap <A-=> +
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
nmap <M-Up> 7
vmap <M-Up> 7
imap <M-Up> 7
nmap <M-Down> 7
vmap <M-Down> 7
imap <M-Down> 7

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

"tabs:
map gr gT
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
map <A-Left> :tabm -1<LF>
map <A-Right> :tabm +1<LF>
map <A-Home> :tabm 0<LF>
map <A-End> :tabm 100<LF>

"buffers:
map <A-,> :bp<LF>
map <A-.> :bn<LF>

"searching and highlighting
map <Space>nh :noh<LF>
nmap <C-l> :noh<LF>:diffupdate<LF>:redraw!<LF>
nmap ]<space> /\s\+$<LF>
nmap [<space> ?\s\+$<LF>
nmap ,mm <Plug>VMarkToggle
nmap ,mn <Plug>VMarkNext
nmap ,mN <Plug>VMarkPrevious
nmap ,mc <Plug>VMarkClearAll
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

"other:
nmap \F :LeaderfFunction<LF>
nmap <A-w> :LeaderfBuffer<LF>
