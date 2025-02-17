source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/bindkey.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/exports.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/path.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/setopt.zsh
source ~/.config/zsh/theming.zsh
source ~/.config/zsh/windows.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/evan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"