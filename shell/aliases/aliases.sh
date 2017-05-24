alias ls="ls -F"
alias ll="ls -lGFh"
alias history="fc -l 1"
alias internet\?="ping 8.8.8.8"
alias b="bundle check || bundle install --local || bundle install"
alias dev="cd $HOME/Dev"
alias serve="python -m SimpleHTTPServer"
alias ip='curl curlmyip.com'
alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

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

# source dotfiles
reload() {
  source $HOME/.zshrc &&
  echo "Your dot files are now \033[1;32msourced\033[0m."
}
