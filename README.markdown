# [fresh] ~/.dotfiles

## Installation

``` sh
FRESH_LOCAL_SOURCE=twe4ked/dotfiles bash -c "`curl -sL get.freshshell.com`"
chsh -s /bin/zsh
```

My dotfiles are managed by [fresh].

[fresh]: https://github.com/freshshell/fresh

## TODO

- Look into fzf: https://github.com/junegunn/fzf.vim
- Improve ctrlp speed: https://github.com/henrik/dotfiles/commit/36156e5d068f6bbdc81505c80c17cd871d5062bd
- https://github.com/sdt/tmux-vim
- Add supertap, see jasoncodes vim completion file (<c-v> <tab> inserts an actual tab)
- Replace vim statusline with lightline.vim: https://github.com/itchyny/lightline.vim
- Look into tmux completion scripts:
  - https://gist.github.com/skanev/1716179
  - https://github.com/skanev/dotfiles/commit/36439ab6b9a7c28d5b04354db1c39d4c3e38902a

## Notes

Use an & to in Vim substitutions:

    :%s/foo_bar/&_baz/g
