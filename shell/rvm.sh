eval "$(rbenv init - | grep -v \^rbenv\ rehash)"
gem() { rbenv exec gem "$@" && rbenv rehash && hash -r; }
