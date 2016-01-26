_tmux_automatic_rename_on() {
  RETURN_VALUE=$?
  if [[ -n "$TMUX" ]]; then
    tmux set automatic-rename on &> /dev/null
  fi
  return $RETURN_VALUE
}

_tmux_window_dir() {
  if [[ -n "$TMUX" ]]; then
    if [[ -n "$(tmux list-windows -F "#{window_name}" | grep -i "$1")" ]]; then
      local DIR="$(basename "$(pwd)"): "
    fi
    echo "$DIR$1"
  fi
}

_tmux_rename_window() {
  if [[ -n "$TMUX" ]]; then
    tmux rename-window "$1"
    AUTO_RENAME=1
  fi
}

_tmux_preexec() {
  case "$1" in
    man\ *)
      _tmux_rename_window "${1/ /: }"
      ;;
    bundle\ open*)
      _tmux_rename_window "${1/bundle open/gem:}"
      ;;
    vim|vim\ *)
      _tmux_rename_window "$(_tmux_window_dir vim)"
      ;;
    rs|rs\ *)
      _tmux_rename_window "$(_tmux_window_dir server)"
      ;;
    fs|fs\ *)
      _tmux_rename_window "$(_tmux_window_dir foreman)"
      ;;
    zs|zs\ *)
      if [[ -n "$TMUX" ]]; then
        tmux send-keys -R
        tmux clear-history
      fi
      _tmux_rename_window "$(_tmux_window_dir zeus)"
      ;;
  esac
}

_tmux_precmd() {
  if [[ $AUTO_RENAME == 1 ]]; then
    _tmux_automatic_rename_on
  fi
  unset AUTO_RENAME
}

[[ -z \$precmd_functions ]] && precmd_functions=()
precmd_functions=(\$precmd_functions _tmux_precmd)

[[ -z \$preexec_functions ]] && preexec_functions=()
preexec_functions=(\$preexec_functions _tmux_preexec)
