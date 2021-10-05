" vim-polyglot
let g:polyglot_disabled = ['php']

call plug#begin('~/.config/nvim/bundle')
Plug 'poiuto/gruvbox9'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"" preview media files
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
"" coc
Plug 'fannheyward/telescope-coc.nvim'
" lsp
" Plug 'neovim/nvim-lspconfig'
" Plug 'glepnir/lspsaga.nvim'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'itchyny/lightline.vim'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'josa42/vim-lightline-coc'
Plug 'itchyny/vim-gitbranch'
Plug 'mhinz/vim-startify'
Plug 'RRethy/vim-illuminate'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'machakann/vim-sandwich'
Plug 'wellle/targets.vim'
Plug 'unblevable/quick-scope'
Plug 'tommcdo/vim-exchange'
Plug 'qstrahl/vim-dentures'
Plug 'markonm/traces.vim'
Plug 'mbbill/undotree'
Plug 'terryma/vim-multiple-cursors'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall -sync coc-json coc-tsserver coc-html coc-htmlhint coc-phpls coc-explorer coc-actions coc-tabnine coc-prettier \| CocUpdateSync'}
Plug 'b3nj5m1n/kommentary'
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext' " :Gblame display the first line of the commit message at the bottom of the screen
Plug 'airblade/vim-gitgutter'
" Plug 'kana/vim-niceblock'
" Plug 'pseewald/vim-anyfold'
Plug 'machakann/vim-highlightedyank'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-vdebug/vdebug'
" open items from quickfix or location list
Plug 'yssl/QFEnter'
call plug#end()
