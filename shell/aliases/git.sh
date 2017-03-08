alias gb='git branch'
alias gba='git branch -a'
alias gcod='gco develop'
alias gcom='gco master'
alias gf='git fetch'
alias gsw='git show --format=fuller'
alias prune='git remote prune origin'
alias garm='git ls-files -dz | xargs -0 git rm'
alias gri='git rebase --interactive'
alias ga='git add'
alias gph='git push heroku'
alias wip='git commit -m "$(printf "WIP\n\n[ci skip]\n")"'
alias gl='glg --all'
alias glr='gl -10'
alias gup='git fetch --prune && git rebase --autostash FETCH_HEAD'

gg() {
  if echo "$@" | grep -q '[[:upper:]]'; then
    git grep $@
  else
    git grep -i $@
  fi
}
