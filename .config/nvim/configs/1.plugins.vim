" vim-polyglot
let g:polyglot_disabled = []

call plug#begin(base_dir.'/bundle')
Plug 'poiuto/gruvbox9'
Plug 'sheerun/vim-polyglot'
" lightline
Plug 'itchyny/lightline.vim'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'josa42/vim-lightline-coc'
Plug 'itchyny/vim-gitbranch'
Plug 'mhinz/vim-startify'
"Plug 'edkolev/tmuxline.vim'
" highlight word under cursor
Plug 'RRethy/vim-illuminate'
Plug 'luochen1990/rainbow'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'machakann/vim-sandwich'
Plug 'wellle/targets.vim'
Plug 'markonm/traces.vim'
Plug 'mbbill/undotree'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/1.x'
  \ }
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'ryanoasis/vim-devicons'
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

call plug#end()
