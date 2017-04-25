gh() {
  if [[ $# -ne 1 ]]; then
    echo "Usage gh <github-url>" 1>&2
    return 1
  fi

  cd "$(
    set -e
    set -o nounset

    GH_URL="$1"
    GH_PROJECT="$(basename "${GH_URL}")"
    GH_USERNAME="$(basename "${GH_URL%/${GH_PROJECT}}")"
    PROJECT_DIRECTORY="$PROJECTS/github/$GH_USERNAME/$GH_PROJECT"

    if [[ ! -d "$PROJECT_DIRECTORY" ]]; then
      mkdir -p "$PROJECTS/github/$GH_USERNAME"
      git clone "$GH_URL" "$PROJECT_DIRECTORY"
    fi

    echo "$PROJECT_DIRECTORY"
  )"
}
