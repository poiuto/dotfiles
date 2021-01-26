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

#ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fast-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# gruvbox for p10k
#source $HOME/.config/zsh/custom/themes/.zsh-theme-gruvbox-material-dark


# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

setopt HIST_IGNORE_DUPS

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#alias bat='batcat'

alias s='sudo'
alias srm='sudo rm -rf'
alias mvr='mv -rf'
alias smv='sudo mv'
alias smvr='sudo mv -rf'
alias cpr='cp -rf'
alias scp='sudo cp -rf'
alias spm='sudo pacman'

alias so='source'
alias v='nvim'
alias sv='sudo -E nvim'
alias ll='ls -AlF --color -h --group-directories-first'
alias la='ls -A --color -h --group-directories-first'
alias l='ls -CF --color -h --group-directories-first'
alias tree='tree -a'
#alias tree='colorls -A --tree --sd -X'
#alias ll='colorls -l --sd -X'
#alias la='colorls -A --sd -X'
#alias ld='colorls -d'
#alias lf='colorls -f'
alias ..='cd ..'
alias ...='cd ../..'
alias h='history'
alias gs='git status'
alias glog='git log --graph --decorate --oneline'

alias :q='exit'
alias yeet='rm -rf'

# keybindings
bindkey -v

colorscript random

# colorls
#source $(dirname $(gem which colorls))/tab_complete.sh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# cgr
export PATH="$(composer config -g home)/vendor/bin:$PATH"
export PATH="$HOME/.config/.composer/vendor/bin:$PATH"
alias drush="PHP_INI_SCAN_DIR=:/etc/drush drush"
