# Cucumber
alias bec='bundle exec cucumber --drb'
alias bec='CUCUMBER_FORMAT=fuubar $([ -S .zeus.sock ] && echo zeus || echo bundle exec) cucumber $([ -S .zeus.sock ] || echo --drb)'

# RSpec
alias ber='$([ -S .zeus.sock ] && echo zeus || echo bundle exec) $(egrep -q "^ {4}rails \(2\." Gemfile.lock && echo spec --format=nested --colour || echo rspec --format=$(egrep -q fuubar Gemfile.lock && echo Fuubar || echo doc)) $([ -S .zeus.sock ] || echo --drb)'
alias berd='ber --format=doc'

# Spork
alias spork='bundle exec spork'
