source ~/.dotfiles/git_aliases
source ~/.dotfiles/rails_aliases
source ~/.dotfiles/git_completion
source ~/.dotfiles/colours

bind 'set completion-ignore-case on '
bind 'set bell-style none' # No bell, because it's damn annoying
bind 'set show-all-if-ambiguous On' # this allows you to automatically show completion without double tab-ing

alias et='mate .' # Open current folder with textmate
alias eprof="mate ~/.dotfiles" # Edit these files
alias pubkey='cat ~/.ssh/*.pub | pbcopy && echo "Keys copied to clipboard"' # Copy pub keys to clipboard

alias gi='sudo gem install --no-ri --no-rdoc'

# Search /Sites folder on 'cd' command
export CDPATH='.:~:~/Sites'

# Go to textmate bundles folder
alias tmbundles='cd ~/Library/Application\ Support/TextMate/Bundles'

# Set textmate as default editor
export EDITOR='mate -w'  # -w is to wait for Textmate window to close

# Make git colourful
git config --global color.ui auto

# sets title of window to be user@host
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\007"'

# Promt config [~(git_branch)] $
# The __git_ps1 comes from the ~/.dotfiles/git_completion file
# Default prompt (export PS1="\h:\W \u\$ ")
export PS1='[\[\e[0;32m\]\W\[\e[0m\]$(__git_ps1 " \[\e[0;36m\](%s)\[\e[0m\]")] \$ '
# [ GREEN current directory END_GREEN ( BLUE git branch END_BLUE ) ] $

# For mysql commands
export PATH=$PATH:/usr/local/mysql/bin

# MOTD
uname -npsr
uptime
echo 'Custom config successfully loaded.'