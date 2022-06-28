set encoding=UTF-8
set t_Co=256
set hidden
set nowrap
set nofoldenable
set ignorecase
set smartcase
set relativenumber
set number
set number relativenumber
set lazyredraw
set redrawtime=10000
set nocompatible
set mouse=a   " enable mouse for all mode
set expandtab
set sidescrolloff=15
set background=dark
if (has("termguicolors")) " enable true color
  set termguicolors
endif
syntax on
filetype on

" use ripgrep instead of grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" leader key
let mapleader = " "

" jumping between tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap >> :tabm +1<CR>
nnoremap << :tabm -1<CR>
" remap switching and resizing windows
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <Leader>> 5<C-W>>
nnoremap <Leader>< 5<C-W><
nnoremap <Leader>= <C-W>=

vnoremap > >gv
vnoremap < <gv
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >
vnoremap <S-Tab> <

nnoremap <Leader>/ :vsplit<CR>
nnoremap <Leader>\ :split<CR>
nnoremap <Leader>t :tab split<CR>

" sessions
map <Leader>sm :mksession! ~/.config/nvim/sessions/
map <Leader>sl :source ~/.config/nvim/sessions/
map <Leader>sd :!rm ~/.config/nvim/sessions/

nnoremap n nzz

" persistent undo
set undodir=$HOME/.config/nvim/undo
set undofile
set undolevels=10000
set undoreload=10000

" yank to clipboard
nnoremap <Leader>y "+y
nnoremap Y y$
set clipboard=unnamedplus

"highlight search pattern matches
set incsearch
set hlsearch
" autocmd InsertEnter * :let @/=""
map <C-s> :let @/=""<CR>

" search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" folding
" set foldmethod=syntax
" set nofoldenable
"autocmd FileType html syntax region htmlFold start="<\z(\<\(area\|base\|br\|col\|command\|embed\|hr\|img\|input\|keygen\|link\|meta\|para\|source\|track\|wbr\>\)\@![a-z-]\+\>\)\%(\_s*\_[^/]\?>\|\_s\_[^>]*\_[^>/]>\)" end="</\z1\_s*>" fold transparent keepend extend containedin=htmlHead,htmlH\d
"autocmd FileType html.twig syntax region htmlFold start="<\z(\<\(area\|base\|br\|col\|command\|embed\|hr\|img\|input\|keygen\|link\|meta\|para\|source\|track\|wbr\>\)\@![a-z-]\+\>\)\%(\_s*\_[^/]\?>\|\_s\_[^>]*\_[^>/]>\)" end="</\z1\_s*>" fold transparent keepend extend containedin=htmlHead,htmlH\d
" autocmd FileType php syntax region htmlFold start="<\z(\<\(area\|base\|br\|col\|command\|embed\|hr\|img\|input\|keygen\|link\|meta\|para\|source\|track\|wbr\>\)\@![a-z-]\+\>\)\%(\_s*\_[^/]\?>\|\_s\_[^>]*\_[^>/]>\)" end="</\z1\_s*>" fold transparent keepend extend containedin=htmlHead,htmlH\d

" 4 spaces.
set shiftwidth=4
set softtabstop=4
set tabstop=4

set nobackup
set nowb
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

set autoread
set autowrite
