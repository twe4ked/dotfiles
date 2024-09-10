if command -v brew &> /dev/null; then
  source "$(brew --prefix)/opt/asdf/libexec/asdf.sh"
else
  echo "WARN: Failed to load asdf via brew"
fi
