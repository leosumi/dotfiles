#
# My customization of the bashrc
# Source this file in ~/.bashrc
#

# solve the 256 color madness
export TERM="xterm-256color"
[ -n "$TMUX" ] && export TERM="screen-256color"

# Use vi style for keybindings
set -o vi

# it is a pain to write the entire command, just cheat
cheat() {
    curl cheat.sh/$1
}

# bash completion support for cheat
_cheatsh_complete_curl()
{
    local cur prev opts
    _get_comp_words_by_ref -n : cur

    COMPREPLY=()
    #cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="$(curl -s cheat.sh/:list)"

    if [[ ${cur} == * ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        __ltrim_colon_completions "$cur"
        return 0
    fi
}
complete -F _cheatsh_complete_curl cheat

# enable bash completion with pandoc
eval "$(pandoc --bash-completion)"

# PATH variable
PATH=$PATH:~/bin
export PATH

# locale configuration
export LANG="en_US.UTF-8"
#export LANGUAGE=
export LC_CTYPE="fr_CH.UTF-8"
export LC_NUMERIC="fr_CH.UTF-8"
export LC_TIME="fr_CH.UTF-8"
export LC_COLLATE="fr_CH.UTF-8"
export LC_MONETARY="fr_CH.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="fr_CH.UTF-8"
export LC_NAME="fr_CH.UTF-8"
export LC_ADDRESS="fr_CH.UTF-8"
export LC_TELEPHONE="fr_CH.UTF-8"
export LC_MEASUREMENT="fr_CH.UTF-8"
export LC_IDENTIFICATION="fr_CH.UTF-8"
#export LC_ALL=

# XDG Base Directory
# Based on version 0.8 of the specification (08 May 2021)
# The variables are set to the default to avoid issue due to unset environment variables
# Only user directories are set
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
#export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
#export XDG_CONFIG_DIRS=/etc/xdg

# Editor
export EDITOR=/usr/bin/nvim

# ~/ clean-up
# Check https://wiki.archlinux.org/title/XDG_Base_Directory
#export LESSHISTFILE="-"

# let's make caps lock rock : use caps lock as ctrl AND esc
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'

# Aliases
# tmux aliases
alias tns='tmux new-session -s'
alias ta='tmux attach'
alias tat='tmux attach -t'
alias tls='tmux ls'

alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

# wal configuration
# Applying the theme to new terminals
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(cat ~/.cache/wal/sequences &)
