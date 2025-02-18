# Colors.
red='\e[0;31m'
RED='\e[1;31m'
green='\e[0;32m'
GREEN='\e[1;32m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
blue='\e[0;34m'
BLUE='\e[1;34m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'

# # Starship setup
# eval "$(starship init zsh)"
#

if command -v oh-my-posh &> /dev/null; then
eval "$(oh-my-posh init zsh --config ~/.config/omp/omp.toml)"
fi
