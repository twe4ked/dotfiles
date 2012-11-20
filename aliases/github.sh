function gh() {
  open "https://$(git config remote.origin.url | sed 's/\.git//' | sed 's/https:\/\///' | sed 's/git:\/\///' | sed 's/git@//' | tr ':' '/')"
}
