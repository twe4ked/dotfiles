export DOTFILES=~/.dotfiles                 # here
export PROJECTS=~/Dev                       # projects directory
export ARCHFLAGS='-arch x86_64'             # archflags
export GREP_OPTIONS='--color=auto'          # double rainbow!
export PATH=$HOME/bin:/usr/local/bin:$PATH  # path settings
export GH_LOGIN=twe4ked                     # used by git-go
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

if type rg >/dev/null 2>&1; then
  # ripgrep respects .gitignore
  export FZF_DEFAULT_COMMAND="rg --files"
fi

path_add() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="${PATH:+"$PATH:"}$1"
  fi
}

path_add "/usr/local/sbin"
path_add "/usr/local/share/npm/bin"
path_add "$HOME/.cargo/bin"
path_add "$HOME/Library/Python/2.7/bin"
path_add "/usr/local/opt/postgresql@9.6/bin"
path_add "/usr/local/opt/mongodb-community@3.4/bin"
path_add "/usr/local/opt/postgresql@10/bin"

if type go >/dev/null 2>&1; then
  export GOPATH="$(realpath `which go` | sed "s/\/libexec\/bin\/go//")"
  path_add "$GOPATH/bin"
fi
