source ~/.dotfiles/git_aliases
source ~/.dotfiles/rails_aliases
source ~/.dotfiles/git_completion

bind 'set completion-ignore-case on '
bind 'set bell-style none' # No bell, because it's damn annoying
bind 'set show-all-if-ambiguous On' # this allows you to automatically show completion without double tab-ing

alias et='mate .' # Open current folder with textmate
alias eprof="mate ~/.dotfiles" # Edit these files
alias pubkey='cat ~/.ssh/*.pub | pbcopy && echo "Keys copied to clipboard"' # Copy pub keys to clipboard

# Search /Sites folder on 'cd' command
export CDPATH='.:~:~/Sites'

# Set textmate as default editor
export EDITOR='mate -w'  # -w is to wait for Textmate window to close

# Make git colourful
git config --global color.ui auto

# sets title of window to be user@host
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\007"'

# Colours stolen from bjeanes dot files (http://github.com/bjeanes/dot-files)
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'