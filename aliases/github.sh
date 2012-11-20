function gh() {
  local PROJECT="https://$(git config remote.origin.url | sed 's/\.git//' | sed 's/https:\/\///' | sed 's/git:\/\///' | sed 's/git@//' | tr ':' '/')"
  case "$1" in
    i|issues|-i|--issues)
      open "$PROJECT/issues"
      ;;
    p|pulls|-p|--pulls)
      open "$PROJECT/pulls"
      ;;
    w|wiki|-w|--wiki)
      open "$PROJECT/pulls"
      ;;
    *)
      open "$PROJECT"
      ;;
  esac
}
