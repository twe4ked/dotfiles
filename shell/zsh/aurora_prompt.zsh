setopt prompt_subst

eval "$(aurora_prompt init zsh "\
{green}{cwd style=short}\
{yellow} ± {git_branch}:{git_commit}{reset}\
{dark_grey} {git_stash}{reset}\
{dark_grey} {jobs}{reset}\
{cyan} $ {reset}")"
