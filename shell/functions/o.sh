# Use 'o' instead of 'open' (o ~/Sites will open the sites folder)
# If no arguments are supplied open the current folder
function o {
  open "${1:-.}"
}
