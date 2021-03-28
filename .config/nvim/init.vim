for f in split(glob('~/.config/nvim/configs/*.vim'), '\n')
  exe 'source' f
endfor
" search and replace in multiple files
":grep "pizza"      or " :grep "pizza" . -R
":cfdo %s/pizza/donut/g | update

" nvim -c 'PlugUpgrade | PlugInstall | CocInstall -sync coc-json coc-tsserver coc-html coc-htmlhint coc-phpls coc-explorer coc-actions coc-tabnine | CocUpdateSync | qall'
