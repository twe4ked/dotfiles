cucumber() {
  if [ -S .zeus.sock ]
  then
    local CMD='zeus cucumber'
  elif [ -x bin/cucumber ]
  then
    local CMD='bin/cucumber'
  else
    local CMD='bundle exec cucumber'
  fi
  (
    [ -n "${ZSH_VERSION:-}" ] && setopt shwordsplit
    exec $CMD "$@"
  )
}
