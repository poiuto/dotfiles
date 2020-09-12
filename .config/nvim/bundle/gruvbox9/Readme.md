# Gruvbox 9 - Vim Colorscheme
* The gruvbox9 is based on [gruvbox](https://github.com/morhetz/gruvbox) and [gruvbox8](https://github.com/lifepillar/vim-gruvbox8), I have add javascript and jsx surpport when use [vim-jsx-improve plugin](https://github.com/neoclide/vim-jsx-improve/pull/47),if you want get a good experiece when you write js and jsx, you must use gruvbox9 with vim-jsx-improve.
* i submit a pr for gruvbox8 to add js and jsx surpport.but i found some color not look good for me ,so i changed some color and add some plugins surpport.
* cause i changed too many colors. i create this repo gruvbox9

# Jsx
![gruvbox9](https://github.com/taigacute/IMG/blob/master/gruvbox9/gruvbox9.png)

# Lightline
* Normal-INSET-VISUAL-REPLACE
![](https://github.com/taigacute/IMG/blob/master/gruvbox9/normal.png)
![](https://github.com/taigacute/IMG/blob/master/gruvbox9/insert.png)
![](https://github.com/taigacute/IMG/blob/master/gruvbox9/visual.png)
![](https://github.com/taigacute/IMG/blob/master/gruvbox9/replace.png)
# Option
- gruvbox9: "medium" contrast;
- gruvbox9_hard: "hard" contrast;
- gruvbox9_soft: "soft" contrast.

Each variant supports dark and light backgrounds, so you must set 'background'
before loading the colorscheme. For example:
>
	set background=dark
	colorscheme gruvbox9

Gruvbox 9 requires at least 256 colors and supports "true color" terminals.

==============================================================================

Set to 1 to include syntax highlighting definitions for several filetypes.
```
let g:gruvbox_filetype_hi_groups = 1
```
Note: setting this to 1 may leave "a wake of destruction when switching away"
(Tim Pope), that is, when you switch to a different colorscheme the
highlighting may look wrong or disabled.

	
Set to 1 if you want to enable italics in the terminal. Note that the terminal
must support italics.defalut 0
>
	let g:gruvbox_italic = 1

Set to 1 if you want strings in italics.defalut 0
>
	let g:gruvbox_italicize_strings = 1

Set to 1 to include syntax highlighting definitions for a number of popular
plugins defalut 0:
>
	let g:gruvbox_plugin_hi_groups = 1

Note: setting this to 1 may leave "a wake of destruction when switching away"
(Tim Pope), that is, when you switch to a different colorscheme the
highlighting may look wrong or disabled.

Set to 1 if you want a transparent background. Takes effect only in the
terminal defalut 0.
>
	let g:gruvbox_transp_bg = 1


## Hacking

Do you want to hack the theme? Install
[Colortemplate](https://github.com/lifepillar/vim-colortemplate), edit the
files in the `templates` folder, then rebuild the colorschemes by sourcing
`make_colorschemes.vim`.

