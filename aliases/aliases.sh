alias ls='ls -laGF'                           # Compact view, show color
alias ..='cd ..'                              # Up one directory
alias ...='cd ../..'                          # Up two directories
alias wiki='vim -c VimwikiIndex'              # Open vimwiki
alias sw='saywhen'                            # Prepend to a command and it will say when complete
alias reload="source $DOTFILES/config"        # Source dotfiles
alias sauce='reload'                          # Meta alias!
alias history='fc -l 1'                       # I want to see more the 16 history items
alias psg='ps aux | grep -v grep | grep $1'   # See what's running
alias d="cd $HOME/Dev"                        # Go to the Dev folder
alias shh='echo nope.'                        # Always type this wrong...

if [[ "$(uname -s)" == 'Darwin' ]]; then
  # Add a poor facsimile for Linux's `free` if we're on Mac OS
  alias free="top -s 0 -l 1 -pid 0 -stats pid | grep '^PhysMem: ' | cut -d : -f 2- | tr ',' '\n'"

  # Mac system information.
  alias macinfo='system_profiler SPHardwareDataType'
fi

source $DOTFILES/aliases/git.sh               # Git aliases
source $DOTFILES/aliases/rails.sh             # Rails aliases
source $DOTFILES/aliases/testing.sh           # Testing aliases
