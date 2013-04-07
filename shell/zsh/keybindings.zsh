# option + right/left
bindkey "\e\e[C" vi-forward-word
bindkey "\e\e[D" vi-backward-word

# make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

# start tetris on ctrl+t
autoload -U tetris
zle -N tetris
bindkey '^T' tetris

bindkey -M menuselect '^o' accept-and-infer-next-history

# handy for renaming files
bindkey "^[m" copy-prev-shell-word
