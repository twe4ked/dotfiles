if [ -e $HOME/.rvm/scripts/rvm ]; then
  source $HOME/.rvm/scripts/rvm     # Load RVM
else
  echo "You don't have RVM installed."
fi