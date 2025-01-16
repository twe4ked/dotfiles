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
alias vim="echo nvim" # use `command nvim` if you really need to

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

# Ripgrep word-boundary
rgwb() {
  rg "\b$1\b"
}

alias rgh="rg --hidden"

http-statuses() {
cat<<EOF | column
100 Continue
101 Switching Protocols
102 Processing
103 Early Hints (Experimental)
200 OK
201 Created
202 Accepted
203 Non-Authoritative Information
204 No Content
205 Reset Content
206 Partial Content
207 Multi-Status
208 Already Reported
226 IM Used
300 Multiple Choices
301 Moved Permanently
302 Found
303 See Other
304 Not Modified
307 Temporary Redirect
308 Permanent Redirect
400 Bad Request
401 Unauthorized
402 Payment Required
403 Forbidden
404 Not Found
405 Method Not Allowed
406 Not Acceptable
407 Proxy Authentication Required
408 Request Timeout
409 Conflict
410 Gone
411 Length Required
412 Precondition Failed
413 Content Too Large
414 URI Too Long
415 Unsupported Media Type
416 Range Not Satisfiable
417 Expectation Failed
418 I'm a teapot
421 Misdirected Request
422 Unprocessable Content
423 Locked
424 Failed Dependency
425 Too Early
426 Upgrade Required
428 Precondition Required
429 Too Many Requests
431 Request Header Fields Too Large
451 Unavailable For Legal Reasons
500 Internal Server Error
501 Not Implemented
502 Bad Gateway
503 Service Unavailable
504 Gateway Timeout
505 HTTP Version Not Supported
506 Variant Also Negotiates
507 Insufficient Storage
508 Loop Detected
510 Not Extended
511 Network Authentication Required
EOF
}
