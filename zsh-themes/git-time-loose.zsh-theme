# ZSH theme

local user_host='%{$fg[yellow]%}[%n@%m]%{$reset_color%}'
local current_dir='%{$fg[yellow]%}[%~]%{$reset_color%}'
local date_time='%{$fg[blue]%}[%D{%Y-%m-%d %T}]%{$reset_color%}'
local git_branch='$(git_prompt_info) $(git_prompt_status)%{$reset_color%}'
local hist_num='%{$fg_bold[black]%}(%h)%{$reset_color%}'
local prompt_char='%{$fg_bold[black]%}>%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'

PROMPT="
${user_host} ${date_time} ${current_dir} ${git_branch}
${hist_num} ${prompt_char} "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[magenta]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"




