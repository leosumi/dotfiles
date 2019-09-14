
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

# Install Ruby Gems to gems in my home
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# Add local pip to PATH
export PATH="${PATH}:${HOME}/.local/bin/"

# wal configuration
# Applying the theme to new terminals
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
