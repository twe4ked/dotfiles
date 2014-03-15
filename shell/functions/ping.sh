ping() {
  HOST="$(echo "$1" | sed "s/http:\/\///" | sed "s/https:\/\///")"
  shift

  command ping "$HOST" "$@"
}
