" theme
syntax on
if has('termguicolors')   " enable true color
  set termguicolors
endif
set t_Co=256
set background=dark
"highlight Normal ctermbg=None
"let g:gruvbox_italic=1
"let g:gruvbox_bold=1
let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_italic = 1
colorscheme gruvbox9

" prettier
let g:prettier#config#config_precedence = 'file-override'
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_auto_focus = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
set expandtab

" highlight words
let g:Illuminate_delay = 100

" hightlight colors
lua require'colorizer'.setup()

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['#fe8019', '#8ec07c', '#fb4934', '#98971a', '#fabd2f', '#83a589'],
\}
" for ejs file
au BufRead,BufNewFile *.ejs set ft=html
au BufRead,BufNewFile *.ejs set ft=mason

" indent line
let g:indentLine_color_term = 239
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['coc-explorer', 'startify']

" rainbow parenthese
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" nerdcommenter
nnoremap <Space>c :call NERDComment(0,"toggle")<CR>
vnoremap <Space>c :call NERDComment(0,"toggle")<CR>

" JS config
"let g:javascript_plugin_jsdoc = 1
"let g:polyglot_disabled = ['jsx', 'tsx', 'js', 'ts']
"let g:vim_jsx_pretty_template_tags = ['html', 'jsx', 'tsx']

" ,, to trigger emmet
let g:user_emmet_leader_key=','

" easymotiog
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)

" Multiple Cursor
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_start_word_key      = '<C-d>'
"let g:multi_cursor_select_all_word_key = '<C-L>'
"let g:multi_cursor_start_key           = 'g<C-d>'
"let g:multi_cursor_select_all_key      = 'g<C-L>'
"let g:multi_cursor_next_key            = '<C-d>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-i>'
"let g:multi_cursor_quit_key            = '<Esc>'

" coc
" Custom icon for coc.nvim statusline
let g:coc_status_error_sign=" "
let g:coc_status_warning_sign=" "
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" coc press Ctrl + O to jump to a symbol
nnoremap <C-o> :CocList outline<CR>
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{StatusDiagnostic()}
" coc-explorer
nmap <Leader>e :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


" gitgutter
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''
let g:gitgutter_override_sign_column_highlight = 1
highlight GitGutterAdd guibg=bg
highlight GitGutterChange guibg=bg
highlight GitGutterDelete guibg=bg
"highlight GitGutterAdd guifg=bg
"highlight GitGutterChange guifg=bg
"highlight GitGutterDelete guifg=bg
highlight SignColumn guibg=bg
"highlight SignColumn ctermbg=bg

" highlighted yank
let g:highlightedyank_highlight_duration = 500

" fzf
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0) " invoke Rg, FZF + ripgrep will not consider filename as a match
let g:fzf_layout = { 'window': {
      \ 'width': 0.9,
      \ 'height': 0.7,
      \ 'highlight': 'Comment',
      \ 'rounded': v:false } }
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
" finding files
nnoremap <silent> <Leader>f :Files<CR>
" finding inside files
nnoremap <silent> <C-p> :Rg<CR>
" finding buffers
nnoremap <silent> <Leader>b :Buffers<CR>

" lightline
"{{{lightline.vim
"{{{lightline.vim-usage
" :h 'statusline'
" :h g:lightline.component
"}}}
"{{{functions
function! CocCurrentFunction()"{{{
  return get(b:, 'coc_current_function', '')
endfunction"}}}
function! Devicons_Filetype()"{{{
  " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction"}}}
function! Devicons_Fileformat()"{{{
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction"}}}
function! Artify_active_tab_num(n) abort"{{{
  return Artify(a:n, 'bold')." \ue0bb"
endfunction"}}}
function! Tab_num(n) abort"{{{
  return a:n." \ue0bb"
endfunction"}}}
function! Gitbranch() abort"{{{
  if gitbranch#name() !=# ''
    return gitbranch#name()." \ue725"
  else
    return "\ue61b"
  endif
endfunction"}}}
function! Artify_inactive_tab_num(n) abort"{{{
  return Artify(a:n, 'double_struck')." \ue0bb"
endfunction"}}}
function! Artify_lightline_tab_filename(s) abort"{{{
  return Artify(lightline#tab#filename(a:s), 'monospace')
endfunction"}}}
function! Artify_lightline_mode() abort"{{{
  return Artify(lightline#mode(), 'monospace')
endfunction"}}}
function! Artify_line_percent() abort"{{{
  return Artify(string((100*line('.'))/line('$')), 'bold')
endfunction"}}}
function! Artify_line_num() abort"{{{
  return Artify(string(line('.')), 'bold')
endfunction"}}}
function! Artify_col_num() abort"{{{
  return Artify(string(getcurpos()[2]), 'bold')
endfunction"}}}
function! Artify_gitbranch() abort"{{{
  if gitbranch#name() !=# ''
    return Artify(gitbranch#name(), 'monospace')." \ue725"
  else
    return "\ue61b"
  endif
endfunction"}}}
"}}}
set laststatus=2  " Basic
set noshowmode  " Disable show mode info
augroup lightlineCustom
  autocmd!
  autocmd BufWritePost * call lightline_gitdiff#query_git() | call lightline#update()
augroup END
let g:lightline = {}
let g:lightline = {
      \ 'colorscheme': 'gruvbox9',
      \}
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#coc#indicator_warnings = ""
let g:lightline#coc#indicator_errors = ""
let g:lightline#coc#indicator_ok = ""
let g:lightline_gitdiff#indicator_added = ''
let g:lightline_gitdiff#indicator_deleted = ''
let g:lightline_gitdiff#indicator_modified = ''
let g:lightline_gitdiff#min_winwidth = '70'
let g:lightline#asyncrun#indicator_none = ''
let g:lightline#asyncrun#indicator_run = 'Running...'
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [  'readonly', 'filename', 'modified', 'devicons_filetype' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
    \           [ 'asyncrun_status', 'coc_status', 'fileformat' ] ]
    \ }
let g:lightline.inactive = {
    \ 'left': [ [ 'filename' , 'modified', 'devicons_filetype' ]],
    \ 'right': [ [ 'fileformat', 'lineinfo' ] ]
    \ }
let g:lightline.tabline = {
    \ 'left': [ [ 'vim_logo', 'tabs' ] ],
    \ 'right': [ [ 'gitbranch', 'gitdiff' ], ]
    \ }
let g:lightline.tab = {
    \ 'active': [ 'tabnum', 'filename', 'modified' ],
    \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

let g:lightline.tab_component = {
      \ }
let g:lightline.tab_component_function = {
      \ 'artify_activetabnum': 'Artify_active_tab_num',
      \ 'artify_inactivetabnum': 'Artify_inactive_tab_num',
      \ 'artify_filename': 'Artify_lightline_tab_filename',
      \ 'filename': 'lightline#tab#filename',
      \ 'modified': 'lightline#tab#modified',
      \ 'readonly': 'lightline#tab#readonly',
      \ 'tabnum': 'Tab_num',
      \ }
let g:lightline.component = {
      \ 'artify_gitbranch' : '%{Artify_gitbranch()}',
      \ 'artify_mode': '%{Artify_lightline_mode()}',
      \ 'artify_lineinfo': "%2{Artify_line_percent()}\uf295 %3{Artify_line_num()}:%-2{Artify_col_num()}",
      "\ 'gitstatus': '%{lightline_gitdiff#get_status()}',
      \ 'gitdiff': '%<%{lightline_gitdiff#get_status()}',
      \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
      \ 'vim_logo': "\ue7c5",
      \ 'mode': '%{lightline#mode()}',
      \ 'absolutepath': '%F',
      \ 'relativepath': '%f',
      \ 'filename': '%t',
      \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
      \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
      \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
      \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
      \ 'modified': '%M',
      \ 'bufnum': '%n',
      \ 'paste': '%{&paste?"PASTE":""}',
      \ 'readonly': '%R',
      \ 'charvalue': '%b',
      \ 'charvaluehex': '%B',
      \ 'percent': '%2p%%',
      \ 'percentwin': '%P',
      \ 'spell': '%{&spell?&spelllang:""}',
      \ 'lineinfo': '%2p%% %3l:%-2v',
      \ 'line': '%l',
      \ 'column': '%c',
      \ 'close': '%999X X ',
      \ 'winnr': '%{winnr()}',
      \ }
let g:lightline.component_function = {
      \ 'gitbranch': 'Gitbranch',
      \ 'devicons_filetype': 'Devicons_Filetype',
      \ 'devicons_fileformat': 'Devicons_Fileformat',
      \ 'coc_status': 'coc#status',
      \ 'coc_currentfunction': 'CocCurrentFunction'
      \ }
let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#coc#warnings',
      \  'linter_errors': 'lightline#coc#errors',
      \  'linter_ok': 'lightline#coc#ok',
      \  'asyncrun_status': 'lightline#asyncrun#status',
      \ }
let g:lightline.component_type = {
      \  'linter_warnings': 'warning',
      \  'linter_errors': 'error',
      \  'linter_ok': 'left',
      \ }
let g:lightline.component_visible_condition = {
      \ 'gitstatus': 'lightline_gitdiff#get_status() !=# ""'
      \ }
""}}}
" tmux line
if executable('tmux') && filereadable(expand('~/.zshrc')) && $TMUX !=# ''
  let g:vimIsInTmux = 1
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
  let g:vimIsInTmux = 0
endif
if g:vimIsInTmux == 1
  let g:airline#extensions#tmuxline#enabled = 0
  let g:tmuxline_preset = {
        \'a'    : '#S',
        \'b'    : '#W',
        \'c'    : [ '#{sysstat_mem} #[fg=blue]\ufa51#{upload_speed}' ],
        \'win'  : ['#I', '#W'],
        \'cwin' : ['#I', '#W', '#F'],
        \'x'    : [ "#[fg=blue]#{download_speed} \uf6d9 #{sysstat_cpu}" ],
        \'y'    : ['%R', '%a', '%m-%d-%Y'],
        \'z'    : '#H #{prefix_highlight}'}
  let g:tmuxline_separators = {
        \ 'left' : "\ue0bc",
        \ 'left_alt': "\ue0bd",
        \ 'right' : "\ue0ba",
        \ 'right_alt' : "\ue0bd",
        \ 'space' : ' '}
  au VimEnter * :Tmuxline lightline
endif
