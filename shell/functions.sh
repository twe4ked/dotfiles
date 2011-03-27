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

# Display a random hint
function hint {
  fn=~/.dotfiles/lib/hints.txt
  sed -n $(awk "END{ print $RANDOM%NR+1}" $fn)p $fn
}

# Restart passenger server
function rp {
  if [ -e tmp ]; then
    touch tmp/restart.txt
    echo 'Restarting passenger server...'
  else
    echo "You don't have a tmp directory, do you want to create one? (y/n)"
    read answer
      if [[ $answer = "y" || $answer = "Y" || $answer = "yes" ]]; then
        mkdir tmp
        echo 'Creating tmp directory...'
        touch tmp/restart.txt
        echo 'Restarting passenger server...'
      fi
  fi
}

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

# Update dotfiles
function update_dotfiles() {
  /bin/sh $DOTFILES/bin/install.sh
}