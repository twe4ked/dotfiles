# Simple script to clone github projects
# This could probably be done much better.

function github() {
  # Start with help
  if [ "$1" = "--help" ]; then
    echo "usage:
  github [username] [repository name] [directory]
         --help

readme:
  To use supply a minumum of two arguments; username, repository name
  Supply a third argument to specify what folder you want to project to be cloned into
  git clone http://github.com/[argument 1]/[argument 2] [argument 3]
  "
  else
    # If its not help, then we need two arguments
    # Otherwise throw an error
    if [[ "$1" = "" || "$2" = "" ]]; then
      echo "
Not enough arguments
See 'github --help'
"
    else
      # We have at least two arguments, do we have a third?
      if [ "$3" = "" ]; then
        git clone http://github.com/$1/$2.git
      # If we have a third argument clone to that directory
      else
        git clone http://github.com/$1/$2.git $3
      fi
    fi
  fi
}