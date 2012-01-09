source $DOTFILES/zsh/completion.sh  # Completions
source $DOTFILES/zsh/git.sh         # Custom version of the oh-my-zsh git plugin
source $DOTFILES/zsh/prompt.sh      # Load my EPIC prompt

# Vendor
source $DOTFILES/zsh/vendor/syntax_highlighting.zsh
source $DOTFILES/zsh/vendor/git_flow_completion.zsh
source $DOTFILES/zsh/vendor/substring_search.zsh
source $DOTFILES/zsh/vendor/z.sh
source $DOTFILES/zsh/vendor/rake_completion.zsh

ZSH_HIGHLIGHT_STYLES+=(           # zsh syntax highlighting styles.
  unknown-token           'bg=red,bold'
  alias                   'fg=magenta,bold'
  single-quoted-argument  'fg=green,bold'
  double-quoted-argument  'fg=green,bold'
  builtin                 'fg=yellow,bold'
  function                'fg=yellow,bold'
)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf' 'fg=red,bold,bg=white')

setopt prompt_subst               # Allows variable substitution in the prompt
setopt nobeep                     # I hate beeps
setopt interactivecomments        # Escape commands so i can use them later (allow comments after commands)
setopt rmstarwait                 # if `rm *` wait 10 seconds before performing it!
setopt autocd                     # change to dirs without cd
setopt listtypes                  # show types in completion
unsetopt auto_name_dirs           # See: http://www.neactar.com/shell/fix-for-wrong-prompt-dir-when-using-zsh-project-rvmrc-and-oh-my-zsh

setopt auto_cd                    # If a command is not in the hash table, and there exists an executable directory by that name, perform the cd command to that directory.
setopt cdablevarS                 # With CDABLEVARS, if the argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory.
setopt multios
autoload colors; colors;

# option + right/left
bindkey "\e\e[C" vi-forward-word
bindkey "\e\e[D" vi-backward-word

# Make search up and down work, so partially type and hit up/down to find relevant stuff
# This is replaced by substring search
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

# Start tetris on ctrl+t (http://twitter.com/Lenary/status/18590249264)
autoload -U tetris
zle -N tetris
bindkey '^T' tetris

# Command history configuration (from oh my zsh)
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt share_history              # share command history data
setopt hist_ignore_dups           # ignore duplication command history list
setopt hist_verify
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt extended_history
setopt append_history
setopt inc_append_history
