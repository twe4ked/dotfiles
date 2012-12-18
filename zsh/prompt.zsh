autoload colors; colors;
autoload vcs_info

# Only show user and hostname when connected as root user or via ssh
function user_hostname {
  if [[ "$USER" = "root" || -n "$SSH_TTY" ]]; then
    echo " "`whoami`@`hostname`
  fi
}

function prompt_color() { # bjeanes
  if [ "$USER" = "root" ]; then
    echo "red"
  else
    if [ -n "$SSH_TTY" ]; then
      echo "blue"
    else
      echo "cyan"
    fi
  fi
}

# Show number of stashed items (BinaryMuse)
git_stash() {
  git stash list 2> /dev/null | wc -l | sed -e "s/ *\([0-9]*\)/\ \+\1/g" | sed -e "s/ \+0//"
}

# Prompt PWD
# http://github.com/bjeanes/dot-files/blob/master/shell/prompt.sh
function prompt_pwd() {
  local repo="$vcs_info_msg_1_"

  parts=(${(s:/:)${${PWD}/#${HOME}/\~}})

  i=0
  while (( i++ < ${#parts} )); do
    part="$parts[i]"
    if [[ "$part" == "$repo" ]]; then
      # if this part of the path represents the repo,
      # underline it, and skip truncating the component
      parts[i]="%U$part%u"
    else
      # Shorten the path as long as it isn't the last piece
      if [[ "$parts[${#parts}]" != "$part" ]]; then
        parts[i]="$part[1,1]"
      fi
    fi
  done

  echo "${(j:/:)parts}"
}

local git_formats="%{${fg_bold[yellow]}%}± %b%c%u:%.7i%{${reset_color}%}"
zstyle ':vcs_info:git*' enable git
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' get-revision true
zstyle ':vcs_info:git*' stagedstr "+"
zstyle ':vcs_info:git*' unstagedstr "*"
zstyle ':vcs_info:git*' formats "$git_formats"
zstyle ':vcs_info:git*' actionformats "%a $git_formats"

function precmd {
  vcs_info

  local cwd='%{${fg_bold[green]}%}$(prompt_pwd)%{${reset_color}%}'
  local usr='%{${fg[yellow]}%}$(user_hostname)%{${reset_color}%} '
  local char='%{${fg[$(prompt_color)]}%}»%{${reset_color}%} '
  local git='${vcs_info_msg_0_}$(git_stash) '
  local timestamp='%* '

  local vi_mode='$(vi_mode_prompt_info) '

  PROMPT=$cwd$usr$char
  RPROMPT=$vi_mode$git$timestamp

  PROMPT2=$char
  RPROMPT2='[%_]'

  if [[ "$TERM" =~ ^xterm ]] then
    print -Pn "\e]2;%n@%M: %~\a"  # display "user@hostname: dir" in the window title
    print -Pn "\e]1;%1~\a"        # display "dir" in the terminal tabs
  fi
}

# Appears at the beginning of (and during) of command execution
function termsupport_preexec {
  emulate -L zsh
  setopt extended_glob
  local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]}  # cmd name only, or if this is sudo or ssh, the next cmd
  print -Pn "\e]2;%n@%M: %~ $CMD\a"       # add the current command to the window title
  print -Pn "\e]1;%1~ $CMD\a"             # add the current command to the terminal tab
}

autoload -U add-zsh-hook
add-zsh-hook preexec termsupport_preexec
