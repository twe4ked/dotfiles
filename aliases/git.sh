alias gs='git status'                         # Show the status
alias gp='git push'                           # Push
alias ga='git add'                            # Add
alias gap='ga -p'                             # Add patch
alias gai='ga -i'                             # Add interactive
alias gc='git commit -v'                      # Commit verbose
alias gca='gc --amend'                        # Commit amend
alias gb='git branch'                         # Git branch
alias gba='git branch -a'                     # Show all branches
alias gco='git checkout'                      # Checkout
alias gd='git diff'                           # Diff
alias gds='gd --staged'                       # Diff staged
alias gup='gup && say gup done'               # Say when gup is complete
alias gcod='gco develop'                      # Back to the develop branch
alias gcom='gco master'                       # Back to the master branch
alias gf='git fetch'                          # Fetch
alias gsw='git show --format=fuller'          # Show
alias gswp='git show -p'
alias prune='git remote prune origin'         # Prune
alias garm='git ls-files -dz | xargs -0 git rm' # Stage deleted files
alias grc='git rebase --continue'
alias gri='git rebase -i'

# Git log
alias glg="git log --graph --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %C(black bold)- %an %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gl='glg HEAD $(cd "$(git rev-parse --git-dir)" && find refs/{heads,remotes,tags} -type f)'

# Push to Heroku (and tell me when you're done)
alias gph='gp heroku && say deployed on heroku'

alias gitconfig='cat .git/config'             # Show git config
alias egitconfig='mate .git/config'           # Edit git config

# Alias for opening GitX OR Git Tower
alias gitx="open -b nl.frim.GitX"
alias tower='open -b com.fournova.Tower `pwd`'

# @jasoncodes' aliases
alias gau='git ls-files --other --exclude-standard -z | xargs -0 git add -Nv'
alias gaur="git ls-files --exclude-standard --modified -z | xargs -0 git ls-files --stage -z | gawk 'BEGIN { RS=\"\0\"; FS=\"\t\"; ORS=\"\0\" } { if (\$1 ~ / e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 /) { sub(/^[^\t]+\t/, \"\", \$0); print } }' | xargs -0t -n 1 git reset -q -- 2>&1 | sed -e \"s/^git reset -q -- /reset '/\" -e \"s/ *$/'/\""
alias gld="git fsck --lost-found | grep '^dangling commit' | cut -d ' ' -f 3- | xargs git show -s --format='%ct %H' | sort -nr | cut -d ' ' -f 2 | xargs git show --stat"
# Usage:
#   gau   Add all untracked files (with `git add --intent-to-add`)
#   gaur  Unstage (reset) any files that you haven't added any hunks from
#   gld   Show all dangling commits
