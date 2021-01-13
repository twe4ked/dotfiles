alias open_saved_page="find tmp/capybara | tail -1 | xargs open"
alias serve-ruby="ruby -run -e httpd . -p 5000"
alias rspec-run-individual="find spec -name '*_spec.rb' -exec bundle exec rspec '{}' \;"
alias rc="bundle exec pry -r ./config/environment"

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

standardrb_branch() {
  git diff $(git merge-base origin/HEAD HEAD).. --name-only --diff-filter=d |
    xargs bundle exec standardrb --only-recognized-file-types --format=progress --fix
}
alias standardrb-branch=standardrb_branch
