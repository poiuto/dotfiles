call plug#begin(base_dir.'/bundle')
" gruvbox
Plug 'hardcoreplayers/gruvbox9'
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
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
