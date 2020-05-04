eval "$(aurora_prompt init zsh "\
{green}{cwd style=short}\
{yellow} ± {git_branch}:{git_commit}\
{dark_grey} {git_stash}\
{dark_grey} {jobs}\
{if last_command_status}{cyan} $ \
{else}{red} $ \
{end}{reset}")"
