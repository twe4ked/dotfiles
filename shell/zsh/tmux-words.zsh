_tmux_pane_words() {
  tmux capture-pane -p |
    xargs echo |                                # remove all the line breaks
    perl -pe 's/[^[:alnum:]\/~.-]|^[\/]/ /g' |  # remove special chars
    perl -pe 's/\s+/\n/g' |                     # split words onto newlines
    sort -u |                                   # sort
    grep -v "^$"                                # remove blank line
}

fzf-tmux-widget() {
  local selected
  if selected=$(_tmux_pane_words | fzf --height="40%" --reverse); then
    LBUFFER="$LBUFFER$selected"
  fi
  zle redisplay
}
zle     -N    fzf-tmux-widget
bindkey '^X'  fzf-tmux-widget
