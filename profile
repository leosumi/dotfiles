
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

