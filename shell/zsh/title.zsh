# appears at the beginning of (and during) of command execution
termsupport_preexec() {
  emulate -L zsh
  setopt extended_glob
  local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]}  # cmd name only, or if this is sudo or ssh, the next cmd
  print -Pn "\e]2;%n@%M: %~ $CMD\a"       # add the current command to the window title
  print -Pn "\e]1;%1~ $CMD\a"             # add the current command to the terminal tab
}

autoload -U add-zsh-hook
add-zsh-hook preexec termsupport_preexec
