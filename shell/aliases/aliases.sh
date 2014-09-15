alias ls="ls -lGFh"
alias history="fc -l 1"
alias internet\?="ping 8.8.8.8"
alias b="bundle check || bundle"
alias dev="cd $HOME/Dev"
alias serve="python -m SimpleHTTPServer"
alias ip='curl curlmyip.com'

# cat with highlight
alias cah="pygmentize -g"

# highest rated results first
alias z="_z -r 2>&1"

# strips formatting from pasteboard
alias scrub='pbpaste | pbcopy'

# copy with a progress bar.
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"

d() {
  if [[ -n "$1" ]]; then
    cd "+$1"
  else
    dirs -v
  fi
}

p() {
  cd "$PROJECTS/$(find "$PROJECTS" -type d -maxdepth 3 -name .git | sed 's#/\.git$##' | sed "s#^$PROJECTS/##" | selecta)"
}

# source dotfiles
reload() {
  source $HOME/.zshrc &&
  echo "Your dot files are now \033[1;32msourced\033[0m."
}
