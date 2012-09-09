# Original from oh-my-zsh plugins.

function zle-line-init zle-keymap-select {
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v

bindkey '^k' vi-cmd-mode # <C-k> for going to command mode

bindkey -M vicmd ' ' execute-named-cmd # Space for command line mode

# Home key variants
bindkey '\e[1~' vi-beginning-of-line
bindkey '\eOH' vi-beginning-of-line

# End key variants
bindkey '\e[4~' vi-end-of-line
bindkey '\eOF' vi-end-of-line

bindkey -M viins '^o' vi-backward-kill-word

bindkey -M vicmd 'yy' vi-yank-whole-line
bindkey -M vicmd 'Y' vi-yank-eol

bindkey -M vicmd 'u' undo
bindkey -M vicmd 'U' redo

bindkey -M vicmd 'H' run-help
bindkey -M viins '\eh' run-help

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down

bindkey -M vicmd '\-' vi-repeat-find
bindkey -M vicmd '_' vi-rev-repeat-find

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi
