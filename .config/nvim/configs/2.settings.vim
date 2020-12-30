set encoding=UTF-8
set t_Co=256
set hidden
"set nowrap
set ignorecase
set smartcase
set relativenumber
set number
set number relativenumber
set nocompatible
set mouse=a   " enable mouse for all mode
set expandtab
"set timeoutlen=500
set background=dark
if (has("termguicolors")) " enable true color
  set termguicolors
endif
syntax on
filetype on

" use ripgrep instead of grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" jj to normal mode
"inoremap jj <ESC>

" remap leader key
let mapleader = " "

" jumping between tabs
nmap <Leader>1 1gt
nmap <Leader>2 2gt
nmap <Leader>3 3gt
nmap <Leader>4 4gt
nmap <Leader>5 5gt
nmap <Leader>6 6gt
nmap <Leader>7 7gt
nmap <Leader>8 8gt
nmap <Leader>9 9gt
" remap switching and resizing windows
nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <Leader>> 4<C-W>>
nmap <Leader>< 4<C-W><
nmap <Leader>= <C-W>=

nmap <Tab> >>
nmap <S-Tab> <<
vmap <Tab> >
vmap <S-Tab> <


nmap <Leader>/ :vsplit<CR>
nmap <Leader>\ :split<CR>

" save session
map <F2> :mksession! ~/vim_session<CR>   " Quick write session with F2
map <F3> :source ~/vim_session<CR>       " And load session with F3

" Persistent undo
" C:\Users\{user}\AppData\Local\nvim-data\undo for windows
set undodir=$HOME/.config/nvim/undo
set undofile
set undolevels=10000
set undoreload=10000

set clipboard=unnamed
set clipboard=unnamedplus

"highlight search pattern matches
set incsearch
set hlsearch
autocmd InsertEnter * :let @/=""

" 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2

set nobackup
set nowb
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

set autoread
set autowrite

" auto remove trailing spaces
"autocmd BufWritePre * %s/\s\+$//e
