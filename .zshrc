# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME='gruvbox-dark'

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fast-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# gruvbox for p10k
#source $HOME/.config/zsh/custom/themes/.zsh-theme-gruvbox-material-dark

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILE=~/.zsh_history
HISTSIZE=1000000
HISTFILESIZE=1000000
SAVEHIST=$HISTSIZE

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoredups

unsetopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# lf
_zlf() {
    emulate -L zsh
    local d=$(mktemp -d) || return 1
    {
        mkfifo -m 600 $d/fifo || return 1
        tmux split -bf zsh -c "exec {ZLE_FIFO}>$d/fifo; export ZLE_FIFO; exec lf" || return 1
        local fd
        exec {fd}<$d/fifo
        zle -Fw $fd _zlf_handler
    } always {
        rm -rf $d
    }
}
zle -N _zlf
bindkey '\ek' _zlf

_zlf_handler() {
    emulate -L zsh
    local line
    if ! read -r line <&$1; then
        zle -F $1
        exec {1}<&-
        return 1
    fi
    eval $line
    zle -R
}
zle -N _zlf_handler

# sxiv
function sx() {
    sxiv $1 &> /dev/null & disown;
}

# zathura
function z() {
    zathura $1 &> /dev/null & disown;
}

# zip
function unzd() {
    if [[ $# != 1 ]]; then echo need 1 zip file; return 1; fi
    target="${1%.zip}"
    unzip "$1" -d "${target##*/}"
}

# git
function gsp() {
    git stash push -m "stash_name_$1"
}
function gsa() {
    git stash apply $(git stash list | grep "git_stash_name_$1" | cut -d: -f1)
}
function gsd() {
    git stash drop $(git stash list | grep "git_stash_name_$1" | cut -d: -f1)
}
function gspop() {
    git stash pop $(git stash list | grep "git_stash_name_$1" | cut -d: -f1)
}

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias	cp='cp -ivrf' 
alias scop='sudo cp -ivrf'
alias	cpy='yes|cp -ivrf' 
alias scpy='yes|sudo cp -ivrf'
alias	mv="mv -iv" 
alias smv='sudo mv -iv'
alias	mvy="yes|mv -iv" 
alias smvy='yes|sudo mv -iv'
alias	rm="rm -vI" 
alias rmr='rm -vIrf'
alias srm='sudo rm -vIrf'
alias	rmy="yes|rm -vI" 
alias rmrt='yes|rm -vIrf'
alias srmy='yes|sudo rm -vIrf'
alias mkd="mkdir -pv" 
alias smkd="sudo mkdir -pv"

alias p='sudo pacman'
  
alias cl='clear'
alias s='sudo'
alias ss='sudo systemctl'
alias so='source'

alias ls='exa --icons --color=always -s=type --group-directories-first'
alias sls='sudo exa --icons --color=always -s=type --group-directories-first'
alias la='exa -a --icons --color=always -s=type --group-directories-first'
alias sla='sudo exa -a --icons --color=always -s=type --group-directories-first'
alias ll='exa --header --long --group --time-style=long-iso --icons --color=always --group-directories-first -a -s=type'
alias sll='sudo exa --header --long --group --time-style=long-iso --icons --color=always --group-directories-first -a -s=type'
alias tree='exa --tree -a --ignore-glob=".git|vendor|node_modules|.vim" --color=always -s=type --group-directories-first'
alias bat='bat --color=always --theme=gruvbox-dark'
  
alias	g="git" 
alias   gs='git status'
alias   gst='git stash'
alias   gc='git checkout'
alias   gp='git pull'
alias   gP='git push'
alias   gf='git fetch'
alias   gm='git merge'
alias   glog='git log --graph --decorate --oneline'
alias   lg='lazygit'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias :q='exit'
alias yeet='rm -vIrf'

alias	ka="killall" 
alias	f="$FILE" 
alias	v="$EDITOR" 
alias   sv="sudo -E $EDITOR"
alias   t="tmux"
# alias	z="zathura"

# re-compile nvidia driver
alias ynd="yay -Rncs --noconfirm nvidia-340xx-lts-dkms; yay -S --noconfirm nvidia-340xx-lts-dkms; reboot"

bindkey -v

# colorscript random
pokemon-colorscripts -r 1 2 3 4 7

# cgr
export PATH="$(composer config -g home)/vendor/bin:$PATH"
export PATH="$HOME/.config/.composer/vendor/bin:/usr/local/bin:/usr/local/sbin:$PATH"
# alias drush="PHP_INI_SCAN_DIR=:/etc/drush drush"

# work
alias pa='php artisan'
function gpamz() {
    grep -E 'Version: |Module: |Expert Mode: |Mode Dev: |MASTER|MERCHANT_ID|MARKETPLACE_ID|MWS|ASSOCIATE_ID' $1
}

function gpcd() {
    grep -E 'Version: |Module: |Expert Mode: |Running Overrides: |USERNAME|PASSWORD' $1
}

function gpmirakl() {
    grep -E 'Version: |Module: ' $1
}
