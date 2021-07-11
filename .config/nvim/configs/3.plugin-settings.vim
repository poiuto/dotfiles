" theme
let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
colorscheme gruvbox9

" prettier
let g:prettier#config#config_precedence = 'file-override'
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_auto_focus = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
" autocmd FileType shell javascript json vim typescript css scss vue md yaml nmap <Leader>p :CocInstall coc-prettier<CR>
nmap <Leader>pa <Plug>(coc-format-selected)<CR>
vmap <Leader>pa <Plug>(coc-format-selected)<CR>
" prettier for PHP
function PrettierPhpCursor()
  let save_pos = getpos(".")
  %! prettier --php-version="7.4" --tab-width=4 --single-quote="true" --brace-style="1tbs" --print-width=100 --parser=php
  call setpos('.', save_pos)
endfunction
command PrettierPhp call PrettierPhpCursor()
nmap <Leader>pp :PrettierPhp<CR>

" sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#fe8019' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#b8bb26' gui=underline ctermfg=81 cterm=underline

" highlight words
let g:Illuminate_delay = 100

" indent blankline
let g:indentLine_color_term = 239
let g:indent_blankline_char = '🭲'
let g:indent_blankline_filetype_exclude = ['coc-explorer', 'startify', 'text', 'help']
let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:indent_blankline_use_treesitter = v:true
let g:indentLine_showFirstIndentLevel = 1
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_context_highlight_list = ['Warning', 'String', 'Type', 'Include', 'Label']
let g:indent_blankline_viewport_buffer = 20
let g:indent_blankline_context_patterns = [
    \"class",
    \"function",
    \"method",
    \"^if",
    \"while",
    \"for",
    \"with",
    \"case",
    \"func_literal",
    \"block",
    \"try",
    \"except",
    \"argument_list",
    \"object",
    \"dictionary",
    \"table",
    \]

" for ejs files
"au BufRead,BufNewFile *.ejs set ft=html
"au BufRead,BufNewFile *.ejs set ft=mason

" .theme files
" au BufRead,BufNewFile *.theme set ft=php

" undotree
nmap <Leader>u :UndotreeToggle<CR>
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

" ,, to trigger emmet
let g:user_emmet_leader_key=','

" easymotion
nmap <silent> <Leader>j <Plug>(easymotion-overwin-f)
nmap / <Plug>(easymotion-sn)

" coc
" applying codeAction to the selected region.xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>rn <Plug>(coc-rename)

" Custom icon for coc.nvim statusline
let g:coc_status_error_sign=" "
let g:coc_status_warning_sign=" "
nmap <silent> gp :call CocAction('doHover')<CR>
nmap <silent> gd :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" coc press Ctrl + O to jump to a symbol
nmap <C-o> :CocList outline<CR>

" snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" <tab> for trigger completion and navigate to next complete item, <S-tab>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{StatusDiagnostic()}
" coc-explorer
nmap <Leader>e :CocCommand explorer<CR>
augroup coc_explorer
  autocmd!
  autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
augroup END

" multiple Cursor
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_start_word_key      = '<C-d>'
"let g:multi_cursor_select_all_word_key = '<C-L>'
"let g:multi_cursor_start_key           = 'g<C-d>'
"let g:multi_cursor_select_all_key      = 'g<C-L>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" gitgutter
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''
let g:gitgutter_override_sign_column_highlight = 1
"highlight GitGutterAdd guibg=bg
"highlight GitGutterChange guibg=bg
"highlight GitGutterDelete guibg=bg
highlight SignColumn guibg=bg
highlight CursorLineNr guibg=bg

" lazygit
nnoremap <silent> <leader>lg :LazyGit<CR>

" fugitive
nmap <Leader>ga :Git add<Space>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit -v -q<CR>
nmap <Leader>gt :Gcommit -v -q %:p<CR>
nmap <Leader>gd :Gdiffsplit<CR>
nmap <Leader>ge :Gedit<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>gw :Gwrite<CR><CR>
nmap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nmap <Leader>gp :Ggrep<Space>
nmap <Leader>gf :Gfetch<CR>
nmap <Leader>gm :Gmerge<CR>
nmap <Leader>gb :Git branch<Space>
nmap <Leader>go :Git checkout<Space>
nmap <Leader>gps :terminal git push<CR>i
nmap <Leader>gpl :Gpull<CR>
nmap <Leader>gg :diffget //2<CR>
nmap <Leader>gj :diffget //3<CR>

" highlighted yank
let g:highlightedyank_highlight_duration = 400

" vim-clap
let g:clap_provider_grep_opts='-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'
nmap <silent> <Leader>fe :Clap filer<CR>
nmap <silent> <Leader>ff :Clap files! --hidden .<CR>
nmap <silent> <Leader>fn :Clap files! +name-only --hidden .<CR>
nmap <silent> <Leader>fb :Clap buffers!<CR>
nmap <silent> <Leader>fw :Clap grep! ++query<cword> .<CR>
nmap <silent> <Leader>fu :Clap grep! ++query=<cword> .<CR>
nmap <silent> <Leader>fr :Clap grep2! ++query<cword> .<CR>
let g:clap_open_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-e': 'vsplit' }
let g:clap_layout = { 'relative': 'editor' }
let g:clap_preview_direction = 'LR' " UD for horizontally

" treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

lua <<EOF
require'colorizer'.setup(
  {
    '*'
  },
  {
    RGB      = true;
    RRGGBB   = true;
    names    = true;
    RRGGBBAA = true;
    rgb_fn   = true;
    hsl_fn   = true;
    css      = true;
    css_fn   = true;
    mode     = 'background';
  }
)

-- kommentary
vim.api.nvim_set_keymap("n", "<Leader>c", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<Leader>c", "<Plug>kommentary_visual_default", {})
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})
require('kommentary.config').configure_language("php", {
    single_line_comment_string = "//",
})

require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "css",
    "python",
    "html",
    "javascript", 
    "jsdoc",
    "json", 
    "jsonc",
    "lua",
    "php", 
    "query", 
    "regex",
    "scss", 
    "typescript",
    "yaml" 
  },
  highlight = {
    enable = true,
    disable = {"php", "javascript"},
  },
  indent = {
    enable = true,
    disable = {"php", "javascript"}
  },
}
EOF

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
let g:lightline.separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.subseparator = { 'left': "\ue0bd", 'right': "\ue0bd" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#coc#indicator_warnings = ""
let g:lightline#coc#indicator_errors = ""
let g:lightline#coc#indicator_ok = ""
"let g:lightline_gitdiff#indicator_added = ''
"let g:lightline_gitdiff#indicator_deleted = ''
"let g:lightline_gitdiff#indicator_modified = ''
let g:lightline_gitdiff#min_winwidth = '70'
let g:lightline#asyncrun#indicator_none = ''
let g:lightline#asyncrun#indicator_run = 'Running...'
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [  'readonly', 'filename', 'modified', 'devicons_filetype' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'linter_errors', 'linter_warnings', 'linter_ok' ],
    \            [ 'asyncrun_status', 'coc_status', 'fileformat' ] ]
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
      \ 'lineinfo': "%{line('.') . '/' . line('$')}",
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
      \  'linter_ok': 'info',
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
        \ 'right' : "\ue0be",
        \ 'right_alt' : "\ue0bf",
        \ 'space' : ' '}
  "au VimEnter * :Tmuxline lightline
  ":TmuxlineSnapshot tmuxline
endif
