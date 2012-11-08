# Use 'o' instead of 'open' (o ~/Sites will open the sites folder)
# If no arguments are supplied open the current folder
function o {
  open "${1:-.}"
}

# Copy pub keys to clipboard
function pubkey {
  cat "~/.ssh/${1:-id_rsa}.pub" | pbcopy
  echo 'Keys copied to clipboard'
}

function h {
  history | grep $1 | tail
}

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
