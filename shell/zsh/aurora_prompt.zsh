eval "$(aurora_prompt init zsh "\
{green}{cwd style=short underline_repo=true}\
{yellow} ± {git_branch}{git_status}:{git_commit}\
{dark_grey} {git_stash}\
{dark_grey} {jobs}\
{if last_command_status}{cyan} $ \
{else}{red} $ \
{end}{reset}")"
