source ~/.fresh/build/vendor/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES+=(
  default                       'fg=black,bold'
  unknown-token                 'fg=red,bold'
  reserved-word                 'bold'
  alias                         'bold'
  builtin                       'bold'
  function                      'bold'
  command                       'bold'
  precommand                    'underline'
  commandseparator              'none'
  hashed-command                'fg=green'
  path                          'underline'
  path_prefix                   'underline'
  path_approx                   'fg=black,bold'
  globbing                      'fg=blue'
  history-expansion             'fg=blue'
  single-hyphen-option          'fg=black,bold'
  double-hyphen-option          'fg=black,bold'
  back-quoted-argument          'fg=green,underline'
  single-quoted-argument        'fg=green'
  double-quoted-argument        'fg=green,bold'
  dollar-double-quoted-argument 'fg=cyan'
  back-double-quoted-argument   'fg=cyan'
  assign                        'none'
)
