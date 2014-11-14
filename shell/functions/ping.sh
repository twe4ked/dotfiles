ping() {
  HOST="$(echo "$1" | sed -E "s/https{0,1}:\/\///")"
  shift

  command ping "$HOST" "$@"
}
