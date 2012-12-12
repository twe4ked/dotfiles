fpath=(~/.fresh/build/completion $fpath)

autoload -U compinit; compinit

# group matches and describe groups
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format $'\e[01;33m-- %d --\e[0m'            # group group description format
zstyle ':completion:*:warnings' format $'\e[01;31m-- No Matches Found --\e[0m'  # message shown when there are no completion matches
zstyle ':completion:*:functions' ignored-patterns '_*'                          # don't auto-complete internal functions (ones prefixed with _)
zstyle ':completion::complete:cd:' tag-order local-directories path-directories
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# load known hosts file for auto-completion with ssh and scp commands
if [ -f ~/.ssh/known_hosts ]; then
  zstyle ':completion:*' hosts $( sed 's/[, ].*$//' $HOME/.ssh/known_hosts )
  zstyle ':completion:*:*:(ssh|scp):*:*' hosts `sed 's/^\([^ ,]*\).*$/\1/' ~/.ssh/known_hosts`
fi

# case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

compinit -i
zmodload -i zsh/complist
