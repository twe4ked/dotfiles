simple_prompt() {
  if test -z "$PROMPT_BAK$RPROMPT_BAK"; then
    PROMPT_BAK="$PROMPT"
    RPROMPT_BAK="$RPROMPT"
    PROMPT='$ '
    unset RPROMPT
  else
    PROMPT="$PROMPT_BAK"
    RPROMPT="$RPROMPT_BAK"
    unset PROMPT_BAK
    unset RPROMPT_BAK
  fi
}
