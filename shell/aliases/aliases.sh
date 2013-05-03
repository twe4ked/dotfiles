alias ls="ls -laGF"                           # compact view, show color
alias history="fc -l 1"                       # show more the 16 history items
alias z="_z -r 2>&1"                          # highest rated results first
alias internet\?="ping 8.8.8.8"               # google?

alias b="bundle"                              # run bundle

alias dev="cd $HOME/Dev"                      # go to the dev directory
alias vimdir="cd $HOME/.dotfiles/vim"         # go to the vim directory
alias dotdir="cd $HOME/.dotfiles"             # go to the dotfiles directory

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
