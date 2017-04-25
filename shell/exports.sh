export DOTFILES=~/.dotfiles                 # here
export PROJECTS=~/Dev                       # projects directory
export ARCHFLAGS='-arch x86_64'             # archflags
export GREP_OPTIONS='--color=auto'          # double rainbow!
export PATH=$HOME/bin:/usr/local/bin:$PATH  # path settings
export GH_LOGIN=twe4ked                     # used by git-go
export HOMEBREW_AUTO_UPDATE_SECS=604800     # 1 week in seconds

path_add() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="${PATH:+"$PATH:"}$1"
  fi
}

path_add "/usr/local/sbin"
path_add "/usr/local/share/npm/bin"
path_add "$HOME/.cargo/bin"

if type go >/dev/null 2>&1; then
  export GOPATH="$(realpath `which go` | sed "s/\/libexec\/bin\/go//")"
  path_add "$GOPATH/bin"
fi
