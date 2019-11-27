alias ls="ls -F"
alias ll="ls -lGFh"
alias history="fc -l 1"
alias internet\?="ping 8.8.8.8"
alias b="bundle check || bundle install --local || bundle install"
alias dev="cd $HOME/Dev"
alias serve="python -m SimpleHTTPServer"
alias ip='curl curlmyip.com'
alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias spotify='open -a Spotify'
alias path='echo "$PATH" | tr ":" "\n"'
alias hex="ruby -e 'puts Integer(ARGV[0]).to_s(16)'"

# cat with highlight
alias cah="pygmentize -g"

# highest rated results first
alias z="_z -r 2>&1"

# strips formatting from pasteboard
alias scrub='pbpaste | pbcopy'

# copy with a progress bar.
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"

alias inflate='ruby -r zlib -e "STDOUT.write Zlib::Inflate.inflate(STDIN.read)"'

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

format_uuid() {
  echo "$1" | sed -E 's/(.{8})(.{4})(.{4})(.{4})(.{12})/\1-\2-\3-\4-\5/' | tr '[:upper:]' '[:lower:]'
}

find_port_in_use() {
  # https://stackoverflow.com/a/4421674/826820
  lsof -nP "-i4TCP:$1" | grep LISTEN
}
