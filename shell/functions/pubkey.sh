# Copy pub keys to clipboard
function pubkey {
  cat "~/.ssh/${1:-id_rsa}.pub" | pbcopy
  echo 'Keys copied to clipboard'
}
