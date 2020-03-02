ghr() {
  if [[ $# -ne 1 ]]; then
    echo "Usage ghr [github url] [github user/repo]" 1>&2
    return 1
  fi

  cd "$(
    setopt KSH_ARRAYS BASH_REMATCH
    set -e
    set -o nounset

    if [[ $1 =~ "^https:\/\/github.com\/([^\/]*)\/([^\/]*)" ]]; then
      GH_PROJECT="${BASH_REMATCH[2]}"
      GH_USERNAME="${BASH_REMATCH[1]}"
      PROJECT_DIRECTORY="$PROJECTS/github/$GH_USERNAME/$GH_PROJECT"
    elif [[ $1 =~ "[^/]*\/[^/]*" ]]; then
      PROJECT_DIRECTORY="$PROJECTS/github/$1"
    fi

    if [[ ! -d "$PROJECT_DIRECTORY" ]]; then
      if [[ $1 =~ "(^https:\/\/github.com\/[^\/]*\/[^\/]*)" ]]; then
        GH_URL="${BASH_REMATCH[1]}"
      fi

      mkdir -p "$PROJECTS/github/$GH_USERNAME"
      git clone "$GH_URL" "$PROJECT_DIRECTORY"
    fi

    echo "$PROJECT_DIRECTORY"
  )"
}
