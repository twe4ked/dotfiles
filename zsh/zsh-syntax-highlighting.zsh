source ~/.fresh/build/vendor/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES+=(
  unknown-token           'bg=red,bold'
  alias                   'fg=magenta,bold'
  single-quoted-argument  'fg=green,bold'
  double-quoted-argument  'fg=green,bold'
  builtin                 'fg=yellow,bold'
  function                'fg=yellow,bold'
)
