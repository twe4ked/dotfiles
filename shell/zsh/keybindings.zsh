bindkey -v

bindkey '^R' history-incremental-search-backward

# option + right/left
bindkey '\e\e[C' vi-forward-word
bindkey '\e\e[D' vi-backward-word

# search history using up/down arrows
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '\e[3~' delete-char

bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
