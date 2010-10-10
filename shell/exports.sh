# Exports
#
# The WORK variable is set in ~/.dotfiles/config
#
export CDPATH=".:$HOME:$HOME/Sites:$HOME/Sites/$WORK" # Search /Sites and /Sites/$WORK folder on 'cd' command 
export EDITOR='mate -w' # Set textmate as default editor (-w is to wait for Textmate window to close)
export ARCHFLAGS='-arch x86_64'             # Archflags

# Path settings
export PATH=$PATH:/usr/local/mysql/bin      # For mysql commands
export PATH="$HOME/.homebrew/bin":$PATH     # For homebrew
export PATH=/Library/PostgreSQL8/bin:$PATH  # For pg gem