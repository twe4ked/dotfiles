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
- Look into tmux completion scripts:
  - https://gist.github.com/skanev/1716179
  - https://github.com/skanev/dotfiles/commit/36439ab6b9a7c28d5b04354db1c39d4c3e38902a
- Fully replace CtrlP with fzf
- http://brettterpstra.com/2016/09/29/a-better-hyper-key-hack-for-sierra/
- https://github.com/junegunn/vim-plug#on-demand-loading-of-plugins

## Notes

Use an & to in Vim substitutions:

    :%s/foo_bar/&_baz/g
