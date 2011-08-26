# Use 'o' instead of 'open' (o ~/Sites will open the sites folder)
# If no arguments are supplied open the current folder
function o {
  if [ "$1" != "" ]; then
    open $1
  else
    open .
  fi
}

# If no arguments are supplied open the current folder with TextMate
function m {
  if [ "$1" != "" ]; then
    mate $1
  else
    et
  fi
}

function h {
  history | grep $1 | tail
}

# Restart passenger or pow server
function rp {
  if [ -e tmp ]; then
    touch tmp/restart.txt
    echo 'Restarting server...'
  else
    echo "You don't have a tmp directory, do you want to create one? (y/n)"
    read answer
      if [[ $answer = "y" || $answer = "Y" || $answer = "yes" ]]; then
        mkdir tmp
        echo 'Creating tmp directory...'
        touch tmp/restart.txt
        echo 'Restarting server...'
      fi
  fi
}

# Lucas Willett (@ltw_)
# https://github.com/ltw/oh-my-zsh/commit/5ae46606d964619b987b4a51b68cc82ee7a9db1d#diff-0
function saywhen {
  if "$@"
  then
    say "$1 $2 done."
    return 0
  else
    say "$1 $2 error."
    return 1
  fi
}

# Update dotfiles
function update_dotfiles() {
  /bin/sh $DOTFILES/bin/install.sh
}

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

# -- Prompt --------------------------------------------------------------------
# Only show user and hostname when connected as root user or via ssh
function user_hostname {
  if [[ "$USER" = "root" || -n "$SSH_TTY" ]]; then
    echo " "`whoami`@`hostname`
  fi
}

function prompt_color() { # bjeanes
  if [ "$USER" = "root" ]; then
    echo "red"
  else
    if [ -n "$SSH_TTY" ]; then
      echo "blue"
    else
      echo "cyan"
    fi
  fi
}
