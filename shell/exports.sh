# Exports
#
# The WORK variable is set in ~/.dotfiles/config
#
export CDPATH=".:$HOME:$HOME/Sites:$HOME/Sites/$WORK" # Search /Sites and /Sites/$WORK folder on 'cd' command 
export EDITOR='mate -w' # Set textmate as default editor (-w is to wait for Textmate window to close)
export ARCHFLAGS='-arch x86_64'             # Archflags

# Path settings
export PATH=$PATH:/usr/local/mysql/bin      # For mysql commands
export PATH=$HOME/.homebrew/bin:$PATH       # For homebrew
export PATH=/Library/PostgreSQL8/bin:$PATH  # For pg gem
export PATH=$PATH:/var/lib/gems/1.8/bin
export PATH=$PATH:/Library/Ruby/Gems/1.8
export PATH=$PATH:/Users/twe4ked/.gem/ruby/1.8
export PATH=$PATH:/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/gems/1.8
export PATH=$PATH:$HOME/bin:/var/lib/gems/1.8/bin
export PATH=$PATH/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin:/usr/local/mysql/bin: