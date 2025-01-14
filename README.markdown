# [fresh] ~/.dotfiles

## Installation

``` sh
FRESH_LOCAL_SOURCE=twe4ked/dotfiles bash -c "`curl -sL get.freshshell.com`"
chsh -s /bin/zsh # Default on MacOS
```

My dotfiles are managed by [fresh].

[fresh]: https://github.com/freshshell/fresh

## Extras

```
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle

# Git config
git config -f ~/.gitconfig.local user.name "Odin Dutton"
git config -f ~/.gitconfig.local user.email "odindutton@gmail.com"
```

## TODO

- https://github.com/sdt/tmux-vim
- Add supertap, see jasoncodes vim completion file (`<C-v> <tab>` inserts an actual tab)
  - fresh jasoncodes/dotfiles vim/config/completion.vim
- http://brettterpstra.com/2016/09/29/a-better-hyper-key-hack-for-sierra/
- https://github.com/junegunn/vim-plug#on-demand-loading-of-plugins
- https://github.com/benvan/sandboxd
- https://kev.inburke.com/kevin/profiling-zsh-startup-time/
- https://github.com/bjeanes/dot-files/commit/cfda3f3e982ef51463b4aaf3625849a62478d8a6
- https://github.com/grassdog/tagman.vim
- https://github.com/unixorn/git-extra-commands
- https://jvns.ca/blog/2024/02/16/popular-git-config-options/#config-changes-i-ve-made-after-writing-this-post

## Notes

Use an & to in Vim substitutions:

    :%s/foo_bar/&_baz/g

defaults write .GlobalPreferences com.apple.sound.beep.sound /Users/odin/Music/silent.aiff
https://github.com/jasoncodes/dotfiles/commit/2c080abcbf328939289f3183a7c59c04096da0b0
