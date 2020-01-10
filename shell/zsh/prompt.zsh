setopt prompt_subst

if [ -x "$(command -v prompt)" ]; then

eval "$(prompt init "\
{green}{cwd style=short}\
{yellow} ± {git_branch}:{git_commit}{reset}\
{dark_grey} {git_stash}{reset}\
{cyan} $ {reset}")"

# If no prompt command
else

autoload colors; colors;
autoload vcs_info

function user_hostname() {
  if [[ "$USER" = "root" || -n "$SSH_TTY" ]]; then
    echo "%n@%m "
  fi
}

function prompt_bg_job() {
  jobs | grep '+' | awk '{print $4 " "}'
}

function git_stash() {
  git stash list 2> /dev/null | wc -l | sed -e "s/ *\([0-9]*\)/\+\1 /g" | sed -e "s/+0 //"
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
      parts[i]="%U$part%u"
    elif [[ $i != ${#parts} ]]; then
      if [[ $part[1,1] == "." ]]; then
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
  echo "$prompt_path "
}

local git_formats="± %b%c%u:%.7i"

zstyle ':vcs_info:git*' enable git
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' get-revision true
zstyle ':vcs_info:git*' stagedstr "+"
zstyle ':vcs_info:git*' unstagedstr "*"
zstyle ':vcs_info:git*' formats "$git_formats"
zstyle ':vcs_info:git*' actionformats "%a $git_formats"

function precmd() {
  vcs_info
}

function git_prompt_info() {
  local info="${vcs_info_msg_0_}"
  if [[ -n "$info" ]]; then
    echo "$info "
  fi
}

function aws_vault() {
  [[ -n "$AWS_VAULT" ]] && echo "$AWS_VAULT "
}

function zle-keymap-select() {
  zle reset-prompt
}
zle -N zle-keymap-select

if [[ $(hostname -s) = "caladan" ]]; then
  local char="λ "
else
  local char="» "
fi

local cwd='%{${fg_bold[green]}%}$(prompt_pwd)%{${reset_color}%}'
local usr='%{${fg[yellow]}%}$(user_hostname)%{${reset_color}%}'
local colored_char='%(?,%F{cyan}$char,%F{red}$char)%f'
local usr='%{${fg[yellow]}%}$(user_hostname)%{${reset_color}%}'
local git='%{${fg_bold[yellow]}%}$(git_prompt_info)%{${reset_color}%}'
local git_stashes='$(git_stash)'
local bg_job='%{${fg_bold[black]}%}$(prompt_bg_job)%{${reset_color}%}'
local aws='%{${fg_bold[black]}%}$(aws_vault)%{${reset_color}%}'

PROMPT="$cwd$usr$bg_job$git_author$git$git_stashes$aws$colored_char"
PROMPT2=$colored_char
RPROMPT2='[%_]'

fi # if [ -x "$(command -v prompt)" ]
