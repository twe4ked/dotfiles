setopt prompt_subst

eval "$(prompt init "\
{green}{cwd style=short}\
{yellow} ± {git_branch}:{git_commit}{reset}\
{dark_grey} {git_stash}{reset}\
{dark_grey} {jobs}{reset}\
{cyan} $ {reset}")"
