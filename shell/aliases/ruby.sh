alias open_saved_page="find tmp/capybara | tail -1 | xargs open"
alias serve-ruby="ruby -run -e httpd . -p 5000"

fs() {
  INPUT="${@:-all}"
  PROCS="$(echo $INPUT | sed "s/ /=1,/g")=1"

  echo "foreman start -m $PROCS"

  if [[ -x ./bin/foreman ]]; then
    ./bin/foreman start -m "$PROCS"
  else
    foreman start -m "$PROCS"
  fi
}
