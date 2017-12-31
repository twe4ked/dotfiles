# emacs bindings
bindkey -e

bindkey '^R' history-incremental-search-backward

# search history using up/down arrows
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "\e[A" history-beginning-search-backward-end
bindkey "\e[B" history-beginning-search-forward-end

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '\e[3~' delete-char

# unbind ^D. for some reason it's bound to `list-choices` by default
bindkey -r ^d
