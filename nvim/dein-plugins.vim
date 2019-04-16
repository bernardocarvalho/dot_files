" https://github.com/Shougo/dein.vim

if &compatible
  set nocompatible
endif               " Disable compatibility to old-time vi

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein')
    " dark powered neo-completion
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

    call dein#add('tpope/vim-unimpaired')
    call dein#add('tpope/vim-fugitive', {'on_cmd' : 'Gstatus'})
    call dein#add('airblade/vim-gitgutter') " shows a git diff in the gutter (sign column)
    call dein#add('easymotion/vim-easymotion')
    call dein#add('tpope/vim-surround')

    call dein#add('Yggdroot/indentLine')
    call dein#add('junegunn/vim-easy-align')
    " displays tags in a window, nmap <F8> :TagbarToggle<CR>
    call dein#add('majutsushi/tagbar')
    call dein#add('ludovicchabant/vim-gutentags')  " manages  tag files
    call dein#add('elzr/vim-json')
    call dein#add('scrooloose/nerdtree')
"    call dein#add('tomtom/tcomment_vim')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('vim-airline/vim-airline') " lean & mean status/tabline

"   Alternatives to ALE
"    call dein#add('neomake/neomake')
"    call dein#add('coddingtonbear/neomake-platformio')
"    call dein#add('vim-syntastic/syntastic')
    call dein#add('w0rp/ale')
    call dein#add('tpope/vim-dispatch')
    call dein#add('radenling/vim-dispatch-neovim')

    call dein#add('sbdchd/neoformat')  "  plugin for formatting code

    " Grepper asynchronously plugin  by Marco Hinz.
    call dein#add('mhinz/vim-grepper')

"    call dein#add('lifepillar/vim-solarized8')
    call dein#add('iCyMind/NeoSolarized') 	" A fixed solarized colorscheme for better truecolor support.
    call dein#add('autozimu/LanguageClient-neovim', {
        \ 'rev': 'next',
        \ 'build': 'bash install.sh',
        \ })

    call dein#end()
    call dein#save_state()
endif

filetype indent on    " Use filetype indentation
filetype plugin indent on " Allow plugins to use filetype indentation

