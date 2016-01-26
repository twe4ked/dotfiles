alias open_saved_page="find tmp/capybara | tail -1 | xargs open"
alias serve-ruby="ruby -run -e httpd . -p 5000"

fs() {
  if [[ -x ./bin/foreman ]]; then
    ./bin/foreman start "$@"
  else
    foreman start "$@"
  fi
}
