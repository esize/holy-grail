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

# pnpm
export PNPM_HOME="/home/evan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end