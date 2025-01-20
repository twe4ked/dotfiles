# De-duplicate PATH
typeset -U PATH

export DOTFILES=~/.dotfiles                 # here
export PROJECTS=~/Dev                       # projects directory
export ARCHFLAGS='-arch x86_64'             # archflags
export GREP_OPTIONS='--color=auto'          # double rainbow!
export PATH=$HOME/bin:/usr/local/bin:$PATH  # path settings
export GH_LOGIN=twe4ked                     # used by git-go
export BUN_INSTALL="$HOME/.bun"
export EDITOR=nvim

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_ANALYTICS=1

export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

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
path_add "$HOME/.gem/ruby/3.3.0/bin"
path_add "$HOME/.asdf/shims"
path_add "$BUN_INSTALL/bin"

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

path_add "/opt/homebrew/opt/postgresql@16/bin"
# export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"

if type go >/dev/null 2>&1; then
  export GOPATH="$(realpath `which go` | sed "s/\/libexec\/bin\/go//")"
  path_add "$GOPATH/bin"
fi
