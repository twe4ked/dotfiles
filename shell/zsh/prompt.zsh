# allows variable substitution in the prompt
setopt prompt_subst

autoload colors; colors;
autoload vcs_info

# only show user and hostname when connected as root user or via ssh
user_hostname() {
  if [[ "$USER" = "root" || -n "$SSH_TTY" ]]; then
    echo " "`whoami`@`hostname`
  fi
}

prompt_color() {
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

prompt_bg_job() {
  jobs | grep '+' | awk '{print $4}'
}

# show number of stashed items
git_stash() {
  git stash list 2> /dev/null | wc -l | sed -e "s/ *\([0-9]*\)/\ \+\1/g" | sed -e "s/ \+0//"
}

function prompt_pwd() {
  if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
    local homerepo=${$(git rev-parse --show-toplevel)/#${HOME}/\~}
    local repopartslen=${#${(s:/:)${homerepo}}}
  fi

  parts=(${(s:/:)${${PWD}/#${HOME}/\~}})

  i=0
  while (( i++ < ${#parts} )); do
    part="$parts[i]"
    if [[ $i == ${repopartslen} ]]; then
      # if this part of the path represents the repo,
      # underline it, and skip truncating the component
      parts[i]="%U$part%u"
    elif [[ $i != ${#parts} ]]; then
      # shorten the path as long as it isn't the last piece
      if [[ $part[1,1] == "." ]]; then
        # if this part of the path starts with a dot, then keep
        # the 2nd letter aswell
        parts[i]="$part[1,2]"
      else
        parts[i]="$part[1,1]"
      fi
    fi
  done

  local prompt_path="${(j:/:)parts}"
  if [ "$parts[1]" != "~" ]; then
    prompt_path="/$prompt_path"
  fi
  echo "$prompt_path"
}

local git_formats="%{${fg_bold[yellow]}%}± %b%c%u:%.7i%{${reset_color}%}"
zstyle ':vcs_info:git*' enable git
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' get-revision true
zstyle ':vcs_info:git*' stagedstr "+"
zstyle ':vcs_info:git*' unstagedstr "*"
zstyle ':vcs_info:git*' formats "$git_formats"
zstyle ':vcs_info:git*' actionformats "%a $git_formats"

precmd() {
  vcs_info
}

local cwd='%{${fg_bold[green]}%}$(prompt_pwd)%{${reset_color}%}'
local usr='%{${fg[yellow]}%}$(user_hostname)%{${reset_color}%} '
local char='%{${fg[$(prompt_color)]}%}»%{${reset_color}%} '
local git='${vcs_info_msg_0_}$(git_stash) '
local timestamp='%* '
local vi_mode='$(which vi_mode_prompt_info &> /dev/null && vi_mode_prompt_info) '
local bg_job='%{${fg_bold[black]}%}$(prompt_bg_job)%{${reset_color}%} '

PROMPT=$cwd$usr$char
RPROMPT=$vi_mode$bg_job$git$timestamp

PROMPT2=$char
RPROMPT2='[%_]'
