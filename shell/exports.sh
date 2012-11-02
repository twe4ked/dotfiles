export EDITOR='mvim'                        # Set mvim as the default editor
export GIT_EDITOR='vim'                     # Use terminal Vim for git
export ARCHFLAGS='-arch x86_64'             # Archflags
export GREP_OPTIONS='--color=auto'          # Double rainbow!
export PATH=$HOME/bin:/usr/local/bin:$PATH  # Path settings

# Show time a command took if over 4 sec
# https://github.com/bjeanes/dot-files/commit/1ae5bc72dac6d5f2cdfbf5a48fdf140c5d085986
export REPORTTIME=4
export TIMEFMT="%*Es total, %U user, %S system, %P cpu"
