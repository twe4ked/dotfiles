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

function __database_yml {
  if [[ -f config/database.yml ]]; then
    ruby -ryaml -rerb -e "puts YAML::load(ERB.new(IO.read('config/database.yml')).result)['${RAILS_ENV:-development}']['$1']"
  fi
}

function psql
{
  if [[ "$(__database_yml adapter)" == 'postgresql' ]]; then
    PGDATABASE="$(__database_yml database)" "$(/usr/bin/which psql)" "$@"
    return $?
  fi
  "$(/usr/bin/which psql)" "$@"
}
export PSQL_EDITOR='vim +"set syntax=sql"'
