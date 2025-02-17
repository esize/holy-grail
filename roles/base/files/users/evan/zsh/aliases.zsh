# Command aliases
alias cd..='cd ..'
alias cp='cp -iv'
alias chmod="chmod -c"
alias chown="chown -c"
alias df='df -h -x squashfs -x tmpfs -x devtmpfs'
alias egrep='egrep --colour=auto'
alias extip='curl icanhazip.com'
alias l.='ls -lhFa --time-style=long-iso --color=auto'
alias ll='ls'
alias ln='ln -iv'
if command -v eza &> /dev/null; then
  alias ls='eza --icons -a --group-directories-first'
fi
alias lsmount='mount |column -t'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias ports='netstat -tulanp'
alias j='jobs -l'
alias rm='rm -iv'
alias rmdir='rmdir -v'
alias ssha='eval $(ssh-agent) && ssh-add'
alias watch='watch -d'
alias wget='wget -c'

if command -v nvim &> /dev/null; then
  alias vim='nvim'
fi

if command -v python3 &> /dev/null; then
  alias python='python3'
fi

if command -v pip3 &> /dev/null; then
  alias pip='pip3'
fi

if command -v lf-ueberzug &> /dev/null; then
  alias lf='lf-ueberzug'
fi

if command -v bat &> /dev/null; then
  alias cat='bat'
fi

alias \$=''

# Safetynets
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Package management
alias update='sudo apt update'
alias upgrade='sudo apt update && sudo apt dist-upgrade && sudo apt autoremove && sudo apt clean'
alias install='sudo apt install'

# dotfile management
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


if command -v bat &> /dev/null; then
  alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
fi

if command -v docker &> /dev/null; then
  alias docker-compose='docker compose'
fi
