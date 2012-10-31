# rbenv info
function rbenv_prompt_info() {
  local ruby_version
  ruby_version=$(rbenv version 2> /dev/null) || return
  echo "$ruby_version" | sed 's/[ \t].*$//'
}

# Formats prompt string for current git commit short SHA
function git_sha() {
  sha=$(git rev-parse --short HEAD 2>/dev/null)

  if [[ "$sha" !=  "" ]]; then
    echo ":"$sha
  fi
}

# Get the name of the branch we are on
function git_branch {
  git branch >/dev/null 2>/dev/null && git_prompt_info && return
  echo '○' # Not in a repository
}

# Show number of stashed items (BinaryMuse)
git_stash() {
  git stash list 2> /dev/null | wc -l | sed -e "s/ *\([0-9]*\)/\ \+\1/g" | sed -e "s/ \+0//"
}

# Prompt PWD
# http://github.com/bjeanes/dot-files/blob/master/shell/prompt.sh
autoload vcs_info
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

# Git theming
ZSH_THEME_GIT_PROMPT_PREFIX="± "
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_UNTRACKED="^"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED=">"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="="

function precmd {
  vcs_info

  local cwd='%{${fg_bold[green]}%}$(prompt_pwd)%{${reset_color}%}'
  local usr='%{${fg[yellow]}%}$(user_hostname)%{${reset_color}%} '
  local char='%{${fg[$(prompt_color)]}%}»%{${reset_color}%} '
  local rbenv='%{${fg_bold[cyan]}%}$(rbenv_prompt_info)%{${reset_color}%} '
  local git='%{${fg_bold[yellow]}%}$(git_branch)$(git_sha)%{${reset_color}%}$(git_stash) '
  local time='%* '

  local vi_mode='$(vi_mode_prompt_info) '

  PROMPT=$cwd$usr$char
  RPROMPT=$vi_mode$rbenv$git$time

  PROMPT2=$char
  RPROMPT2='[%_]'

  if [[ "$TERM" =~ ^xterm ]] then
    print -Pn "\e]2;%n@%M: %~\a"  # display "user@hostname: dir" in the window title
    print -Pn "\e]1;%1~\a"        # display "dir" in the terminal tabs
  fi
}

# Stolen from Lucas Willet
# https://github.com/ltw/oh-my-zsh/blob/4dd3b04d355c62940ac30b2634b169b9338baa7b/themes/odin.zsh-theme
function note_prompt {
  if [[ -f .notes ]]
  then
    echo
    sed "s/^/${fg_bold[red]}!${reset_color} /" .notes
  fi
}

chpwd() {
  note_prompt
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
