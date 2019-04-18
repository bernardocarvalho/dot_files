" File: init.vim
" Link: https://github.com/vonbrownie/dotfiles
" https://github.com/mhartington/dotfiles/blob/master/config/nvim/init.vim
"
" let g:python3_host_prog = '/usr/local/bin/python3.7'
" let g:python_host_prog = '/usr/bin/python2'
" Using Pyenv on MAC
let g:python3_host_prog = '~/.pyenv/shims/python3'
let g:python_host_prog = '/usr/local/bin/python2'

source $HOME/.config/nvim/dein-plugins.vim

" == General Configuration ==
syntax enable       " Turn on syntax highlighting

"   icymind/NeoSolarized
set termguicolors
set background=dark  " or "ligth"
colorscheme NeoSolarized
" colorscheme solarized8

let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_max_signs = 500  " default value

" System mappings  ----------------------------------------------------------
"{{{
" leader is ,
let mapleader = ','
" Fuzzy Find in normal mode
nnoremap <C-p> :<C-u>FZF<CR>

" No need for ex mode
nnoremap Q <nop>
vnoremap // y/<C-R>"<CR>
" recording macros is not my thing
map q <Nop>
" portuguese keyboard remap
" :set langmap=º[,`]

" noremap  <silent> <Home> g<Home>
" noremap  <silent> <End>  g<End>
" inoremap <silent> <Home> <C-o>g<Home>
" inoremap <silent> <End> <C-o>g<End>

set showmatch               " Show matching brackets.
" ================ Searching ========================
" Ignorecase when searching
set ignorecase              " Do case insensitive matching
" incremental search - Vim starts searching when we start typing
set incsearch
" When searching try to be smart about cases
set smartcase

set mouse=a                 " Enable mouse usage (all modes)
" set mouse=v               " middle-click paste with mouse
set hlsearch                " highlight search results
set cursorline              " Highlight the current line
" ================ Indentation ======================
set autoindent              " indent a new line the same amount as the line just typed
set smartindent
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
" ================= Folding  ===============
set foldmethod=syntax   "  indent, marker
autocmd BufRead * normal zR " keep the folds open as you open new files, zM - close all folds

set number                  " Show line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style

"}}}"

" NERDTree ------------------------------------------------------------------
"{{{
map <C-n> :NERDTreeToggle<CR>
" shift+i (show hidden files)
" quit nerd tree on file open
let g:NERDTreeQuitOnOpen = 1

"}}}

" let g:neomake_open_list = 2

let g:deoplete#enable_at_startup = 1

" Linting {{{
let g:ale_linters = {
            \ 'python': ['pylint', 'flake8'],
            \ 'javascript': ['eslint'],
            \ 'cpp': ['clang']
            \ }
let g:ale_fixers = {
            \   'c': ['clang-format', 'uncrustify'],
            \   'cpp': ['clang-format', 'uncrustify']
            \}

" autocompletion
let g:ale_completion_enabled = 1
let g:ale_c_parse_makefile  = 1  "ALE will run `make -n` to automatically determine flags to  set for C or C++ compilers

let g:ale_lint_on_text_changed = 'never'   " 'always' " default
let g:ale_lint_on_save = 1          " default
let g:ale_lint_on_enter = 1         " default
let g:ale_lint_on_filetype_changed = 1 " default:w
let g:ale_sign_column_always = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

"  ############## Neoformat ##########
" Not realy working...
"let g:neoformat_python_autopep8 = {
"            \ 'exe': ['autopep8'],
"            \ 'args': ['-s 4', '-E'],
"            \ 'replace': ['1'] " replace the file, instead of updating buffer (default: 0),
"            \ 'stdin': [1], " send data to stdin of formatter (default: 0)
"            \ 'env': ["DEBUG=1"], " prepend environment variables to formatter command
"            \ 'valid_exit_codes': [0, 23],
"            \ 'no_append': ['1'],
"            \ }
"            https://yufanlu.net/2018/09/03/neovim-python/
"let g:neoformat_python_autopep8 = {
"\ 'exe': 'autopep8',
"\ 'stdin': 0,
"\ }
"\ 'args': ['-s 4', '-E'],
"\ 'replace': 1,
"\ 'stdin': 1, NOT Running
"\ 'env': ["DEBUG=1"],
"\ 'valid_exit_codes': [0, 23],
"\ 'no_append': 1,

let g:neoformat_run_all_formatters = 1 "by default Neoformat stops after the first succeeds
let g:neoformat_enabled_python = ['yapf', 'autopep8']
let g:neoformat_enabled_c = ['uncrustify']
let g:neoformat_enabled_cpp = ['uncrustify']
" basic formatting when a filetype is not found. Disabled by default.
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" ########## ctags #####

set statusline+=%{gutentags#statusline()}

" ########## C / C++  #############

"
" }}}

source $HOME/.config/nvim/grepper-config/basic.vim
source $HOME/.config/nvim/key-mappings.vim

" https://fortes.com/2017/language-server-neovim/
" https://github.com/autozimu/LanguageClient-neovim
" https://github.com/palantir/python-language-server
let g:LanguageClient_serverCommands = {
            \ 'python': ['/usr/local/bin/pyls'],
            \ }
