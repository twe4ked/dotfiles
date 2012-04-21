autoload -U compinit; compinit

# Group matches and describe groups
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format $'\e[01;33m-- %d --\e[0m'            # Group group description format
zstyle ':completion:*:warnings' format $'\e[01;31m-- No Matches Found --\e[0m'  # Message shown when there are no completion matches

zstyle ':completion:*:functions' ignored-patterns '_*'                          # Don't auto-complete internal functions (ones prefixed with _)
zstyle ':completion::complete:cd:' tag-order local-directories path-directories
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# Disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Load known hosts file for auto-completion with ssh and scp commands
if [ -f ~/.ssh/known_hosts ]; then
  zstyle ':completion:*' hosts $( sed 's/[, ].*$//' $HOME/.ssh/known_hosts )
  zstyle ':completion:*:*:(ssh|scp):*:*' hosts `sed 's/^\([^ ,]*\).*$/\1/' ~/.ssh/known_hosts`
fi

# Case-insensitive (all), partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

unsetopt flowcontrol
unsetopt menu_complete                                                          # Do not autoselect the first completion entry
setopt auto_menu                                                                # Show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

compinit -i
zmodload -i zsh/complist

bindkey -M menuselect '^o' accept-and-infer-next-history                        # Should this be in keybindings?

