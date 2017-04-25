# [fresh] ~/.dotfiles

## Installation

``` sh
FRESH_LOCAL_SOURCE=twe4ked/dotfiles bash -c "`curl -sL get.freshshell.com`"
chsh -s /bin/zsh
```

My dotfiles are managed by [fresh].

[fresh]: https://github.com/freshshell/fresh

## TODO

- https://github.com/sdt/tmux-vim
- Add supertap, see jasoncodes vim completion file (`<C-v> <tab>` inserts an actual tab)
  - fresh jasoncodes/dotfiles vim/config/completion.vim
- http://brettterpstra.com/2016/09/29/a-better-hyper-key-hack-for-sierra/
- https://github.com/junegunn/vim-plug#on-demand-loading-of-plugins
- https://github.com/benvan/sandboxd
- https://kev.inburke.com/kevin/profiling-zsh-startup-time/
- https://github.com/bjeanes/dot-files/commit/cfda3f3e982ef51463b4aaf3625849a62478d8a6

## Notes

Use an & to in Vim substitutions:

    :%s/foo_bar/&_baz/g
