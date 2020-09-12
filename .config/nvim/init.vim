let g:base_dir = '~/.config/nvim'
for f in split(glob(base_dir.'/configs/*.vim'), '\n')
   exe 'source' f
endfor

" search and replace in multiple files
" :grep "pizza"      or " :grep "pizza" . -R
" :cfdo %s/pizza/donut/g | update

" convert all files in current directory to unix format
" find . -type f -print0 | xargs -0 -n 1 -P 4 dos2unix

" Don't forget mkdir folder $HOME/.vim/undo and remove " before undodir in settings.vim
" C:\Users\Admin\AppData\Local\nvim-data\undo for windows

" coc.nvim, remember to run these commands
":CocInstall coc-json coc-tsserver
":CocInstall coc-explorer
