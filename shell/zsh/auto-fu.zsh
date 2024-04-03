# https://github.com/hchbaw/auto-fu.zsh/blob/master/auto-fu.zsh

# establish `zle-line-init' containing `auto-fu-init' something like:
zle-line-init () {
  auto-fu-init
}
zle -N zle-line-init

# use the _oldlist completer something like below.
zstyle ':completion:*' completer _oldlist _complete
# (If you have a lot of completer, please insert _oldlist before _complete.)

# establish `zle-keymap-select' containing `auto-fu-zle-keymap-select'.
zle -N zle-keymap-select auto-fu-zle-keymap-select

# style:
zstyle ':auto-fu:var' postdisplay $'\n-auto-fu-'
