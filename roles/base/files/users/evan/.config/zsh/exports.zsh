# Prevent tmux from asking the terminal emulator for capabilities, as this can cause the terminal
# emulator to send escape sequences that are not understood by tmux due to setting escape-time to 0.
# NOTE: This assumes that the terminal emulator in use supports these capabilities.
export TERM=tmux-256color
export TERMINAL=/usr/bin/wezterm
export GREP_COLOR='3;33'

# Not all servers have terminfo for rxvt-256color. :<
#if [ "${TERM}" = 'rxvt-256color' ] && ! [ -f '/usr/share/terminfo/r/rxvt-256color' ] && ! [ -f '/lib/terminfo/r/rxvt-256color' ] && ! [ -f "${HOME}/.terminfo/r/rxvt-256color" ]; #then
#    export TERM='rxvt-unicode'
#fi

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export display=:0

export SUDO_EDITOR="nvim"
alias "sudoedit"='function _sudoedit(){sudo -e "$1";};_sudoedit'
