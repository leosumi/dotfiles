# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# if running zsh
if [ -n "$ZSH_VERSION" ]; then
    # include .zshrc if it exists
    if [ -f "$HOME/.zshrc" ]; then
        . "$HOME/.zshrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# solarized
export SOLARIZED="dark"

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

# solve the 256 color madness
export TERM="xterm-256color"
[ -n "$TMUX" ] && export TERM="screen-256color"

# let's make caps lock rock : use caps lock as ctrl AND esc
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'

