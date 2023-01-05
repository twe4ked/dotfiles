alias gb='git branch'
alias gba='git branch -a'
alias gcod='gco develop'
alias gf='git fetch'
alias gsw='git show --format=fuller --stat --patch'
alias prune='git remote prune origin'
alias garm='git ls-files -dz | xargs -0 git rm'
alias gri='git rebase --interactive'
alias ga='git add'
alias gph='git push heroku'
alias gl='glg --exclude=refs/stash --all'
alias glr='gl -10'
alias gup='git fetch --prune && git rebase --autostash FETCH_HEAD'

gss() {
  git stash show --patch "stash@{${1:-0}}"
}

gcom() {
  if git show-ref --verify --quiet refs/heads/main; then
    git checkout main
  else
    git checkout master
  fi
}

gg() {
  if echo "$@" | grep -q '[[:upper:]]'; then
    git grep $@
  else
    git grep -i $@
  fi
}

ggw() {
  gg "\b$@\b"
}

wip() {
  if [[ $# > 0 ]]; then
    message="WIP: $*"
  else
    message="WIP"
  fi

  git commit -m "$(printf "$message\n\n[ci skip]\n")"
}

git-list-files-ordered-by-date() {
  git ls-tree -r --name-only HEAD "$@" | while read filename; do
    echo "$(git log -1 --format="%ai" -- $filename) $filename"
  done | sort
}

git-branch-delete-merged() {
  git branch --merged | grep -vwE 'main|master'

  echo -n "Delete branches [Y/n]? "
  read answer
  case $answer in
    [Yy]*|"")
      git branch --merged | grep -vwE 'main|master' | xargs git branch -d
      ;;
    *)
      return
      ;;
  esac
}
