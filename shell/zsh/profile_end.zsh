# https://esham.io/2018/02/zsh-profiling
unsetopt XTRACE
exec 2>&3 3>&-
