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
