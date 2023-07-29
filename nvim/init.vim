let g:python_host_prog = '~/.asdf/shims/python2'
let g:python3_host_prog = '~/.asdf/shims/python3'
let g:dein#install_github_api_token = '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'

runtime! plugins/dein.rc.vim
runtime! keymap.vim
runtime! colorscheme.vim

syntax enable
set number
set title
set cursorline
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set softtabstop=2
set clipboard=unnamedplus
set nobackup
set nowritebackup
set autochdir

set pumblend=30
