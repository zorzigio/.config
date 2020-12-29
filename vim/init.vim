" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

if exists('g:vscode')
    " VSCode extension
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine
else
    " ordinary neovim
endif

call plug#begin('~/.config/nvim')
    Plug 'bling/vim-airline'
    Plug 'Shougo/deoplete.nvim', { 'do': ': UpdateRemotePlugins' }
    Plug 'scrooloose/nerdtree'
    Plug 'morhetz/gruvbox' " color scheme
    Plug 'tpope/vim-commentary' 
    Plug 'tpope/vim-surround' 
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mileszs/ack.vim'
call plug#end()

syntax enable " enable syntax processing

filetype plugin indent on
syntax on
" Show file stats
set ruler
" Blink cursor on error instead of beeping (grr)
set visualbell
set relativenumber
set number
set incsearch
set nohlsearch
set smartcase
set showcmd " show command in bottom bar
set cursorline " highlight current line
set incsearch " search as characters are entered
set hlsearch " highlight matches

colorscheme gruvbox

""" Tab Completion
set wildmenu " visual autocomplete for command menu
set wildignorecase
set wildmode=list:longest,full

""" Search
set ignorecase   " case-insensitive search
set smartcase    " but case-sensitive if expression contains a capital letter

""" Buffers
set hidden       " Handle multiple buffers better
" You can abandon a buffer with unsaved changes without a warning

""" Terminal
set title        " show terminal title

""" Editor
set scrolloff=3  " show 3 lines of context around cursor
set list         " show invisible characters

""" Global Tabs and Spaces configurations
set expandtab    " use spaces instead of tabs
set tabstop=2    " global tab width
set shiftwidth=2 " spaces to use when indenting

""" Turn on spell check
set spell

" ---------- MAPPINGS ---------- 
inoremap jj <esc>
nnoremap <SPACE> <Nop>
let mapleader=" "
" fzf
nnoremap <silent> <leader>o :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" reselect the text just copied
nnoremap <leader>v V`]
" remove highlighting after search
nnoremap <leader>h :noh<CR>
" toggle nerd tree
nnoremap <C-n> :NERDTreeToggle<CR>
" Automatically close NERDTree when you open a file
let NERDTreeQuitOnOpen=1
