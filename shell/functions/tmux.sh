unalias zs 2> /dev/null
zs() {
  if [[ -n "$TMUX" ]]; then
    tmux send-keys -R
    tmux clear-history
    tmux rename-window "$(_tmux_window_name zeus)"
  fi
  zeus start
  _trigger_tmux_rename
}

unalias rs 2> /dev/null
rs() {
  if [[ -n "$TMUX" ]]; then
    tmux rename-window "$(_tmux_window_name server)"
  fi
  rails server "$@"
  _trigger_tmux_rename
}

vim() {
  if [[ -n "$TMUX" ]]; then
    tmux rename-window "$(_tmux_window_name vim)"
  fi
  command vim "$@"
  _trigger_tmux_rename
}

_trigger_tmux_rename() {
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
