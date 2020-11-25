call plug#begin(base_dir.'/bundle')
" gruvbox
Plug 'poiuto/gruvbox9-based'
Plug 'morhetz/gruvbox'
Plug 'chemzqm/vim-jsx-improve'

" lightline
Plug 'itchyny/lightline.vim'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'josa42/vim-lightline-coc'
Plug 'itchyny/vim-gitbranch'
Plug 'mhinz/vim-startify'
" tmux line
Plug 'edkolev/tmuxline.vim'

" highlight word under cursor
Plug 'RRethy/vim-illuminate'
" highlight match parentheses
Plug 'luochen1990/rainbow'
" color highlighter
Plug 'norcalli/nvim-colorizer.lua'

" surrround
"Plug 'tpope/vim-surround'

" sandwich
Plug 'machakann/vim-sandwich'
Plug 'wellle/targets.vim'

" fzf
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

" vim-clap
Plug 'liuchengxu/vim-clap'
" Build the extra binary if cargo exists on your system.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
" The bang version will try to download the prebuilt binary if cargo does not exist.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" :Clap install-binary[!] will always try to compile the binary locally,
" if you do care about the disk used for the compilation, try using the force download way,
" which will download the prebuilt binary even you have installed cargo.
Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
" `:Clap install-binary[!]` will run using the terminal feature which is inherently async.
" If you don't want that and hope to run the hook synchorously:
Plug 'liuchengxu/vim-clap', { 'do': has('win32') ? 'cargo build --release' : 'make' }

" multiple cursors
Plug 'terryma/vim-multiple-cursors'

" identLine
Plug 'Yggdroot/indentLine'

"  coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"  nerdcommenter
Plug 'scrooloose/nerdcommenter'

"  emmet
Plug 'mattn/emmet-vim'

"  easymotion
Plug 'easymotion/vim-easymotion'

" git fugitive
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

" prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/1.x'
  \ }

" auto pairs
Plug 'jiangmiao/auto-pairs'

" highlighted yank
Plug 'machakann/vim-highlightedyank'

" devicons
Plug 'ryanoasis/vim-devicons'

call plug#end()
