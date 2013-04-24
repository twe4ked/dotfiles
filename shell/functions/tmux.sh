unalias zs 2> /dev/null
zs() {
  if [[ -n "$TMUX" ]]; then
    tmux send-keys -R
    tmux clear-history
    tmux rename-window "$(_tmux_window_name zeus)"
  fi
  zeus start
  _tmux_automatic_rename_on
}

unalias rs 2> /dev/null
rs() {
  if [[ -n "$TMUX" ]]; then
    tmux rename-window "$(_tmux_window_name server)"
  fi
  rails server "$@"
  _tmux_automatic_rename_on
}

vim() {
  if [[ -n "$TMUX" ]]; then
    tmux rename-window "$(_tmux_window_name vim)"
  fi
  command vim "$@"
  _tmux_automatic_rename_on
}

man() {
  if [[ -n "$TMUX" ]]; then
    tmux rename-window "man: $1"
  fi
  command man "$@"
  _tmux_automatic_rename_on
}

_tmux_automatic_rename_on() {
  RETURN_VALUE=$?
  if [[ -n "$TMUX" ]]; then
    tmux set automatic-rename on &> /dev/null
  fi
  return $RETURN_VALUE
}

_tmux_window_name() {
  if [[ -n "$(tmux list-windows -F "#{window_name}" | grep -i "$1")" ]]; then
    local DIR="$(basename "$(pwd)"): "
  fi
  echo "$DIR$1"
}
