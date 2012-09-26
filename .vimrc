syntax enable
let g:zenburn_high_Contrast=1
let g:zenburn_old_Visual=1
let g:zenburn_alternate_Visual=1
colorscheme zenburn

"Stuff for pathogen
"filetime off
"call pathogen#runtime_append_all_bundles()
"filetype plugin indent on

set nocompatible

"Fix for some security exploit
set modelines=0

"Set tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Other stuff
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

let mapleader=","

"Searching/Moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"Long line handling
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

"Invisible characters
set list
set listchars=tab:▸\ ,eol:¬

"Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

"Hardwrap paragraph - figure out later
nnoremap <leader>q gqip

"Highlight text just pasted
nnoremap <leader>v V`]

"Remap hh to ESC
inoremap hh <ESC>

"Split handling
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

