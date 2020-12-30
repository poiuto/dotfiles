let g:base_dir = '~/.config/nvim'
for f in split(glob(base_dir.'/configs/*.vim'), '\n')
  exe 'source' f
endfor

" search and replace in multiple files
" :grep "pizza"      or " :grep "pizza" . -R
" :cfdo %s/pizza/donut/g | update

" convert files in current directory to unix format
" find . -type f -print0 | xargs -0 -n 1 -P 4 dos2unix

" undo for windows
" C:\Users\{user}\AppData\Local\nvim-data\undo

" coc
"CocInstall coc-json coc-tsserver coc-explorer coc-actions coc-phpls coc-tabline
