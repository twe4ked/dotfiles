alias ls="ls -laGFh"
alias history="fc -l 1"
alias internet\?="ping 8.8.8.8"
alias b="bundle"
alias dev="cd $HOME/Dev"
alias serve="python -m SimpleHTTPServer"

# highest rated results first
alias z="_z -r 2>&1"



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
