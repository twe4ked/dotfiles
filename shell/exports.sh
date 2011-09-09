# Exports
export CDPATH=".:$HOME:$HOME/Sites:$HOME/Sites/$WORK" # Search /Sites and /Sites/$WORK folder on 'cd' command 
export EDITOR='mvim'                        # Set mvim as the default editor
export GIT_EDITOR='vim'                     # Use terminal Vim for git
export ARCHFLAGS='-arch x86_64'             # Archflags
export GREP_OPTIONS='--color=auto'          # Double rainbow!

# Path settings
export PATH=$PATH:/usr/local/mysql/bin      # For mysql commands
export PATH=$HOME/.homebrew/bin:$PATH       # For homebrew
export PATH=$PATH:/var/lib/gems/1.8/bin
export PATH=$PATH:/Library/Ruby/Gems/1.8
export PATH=$PATH:/Users/twe4ked/.gem/ruby/1.8
export PATH=$PATH:/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/lib/ruby/gems/1.8
export PATH=$PATH:$HOME/bin:/var/lib/gems/1.8/bin
export PATH=/usr/local/bin:$PATH:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/X11/bin:/usr/local/mysql/bin:

# Show time a command took if over 2 sec
# https://github.com/bjeanes/dot-files/commit/1ae5bc72dac6d5f2cdfbf5a48fdf140c5d085986
export REPORTTIME=2
export TIMEFMT="%*Es total, %U user, %S system, %P cpu"
