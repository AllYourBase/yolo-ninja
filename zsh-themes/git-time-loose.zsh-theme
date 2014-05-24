# ZSH theme

local user_host='%{$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$fg[yellow]%}${PWD/#$HOME/~}%{$reset_color%}'
# local date_time='%{$fg[blue]%}%D{%Y-%m-%d %T}%{$reset_color%}'
local date_time='%{$fg[green]%}%D{%T}%{$reset_color%}'
local git_branch='$(git_prompt_info) $(git_prompt_status)%{$reset_color%}'
local ruby_ver='%{$fg[red]%}r$(rbenv version-name)%{$reset_color%}'
local perl_ver='%{$fg[blue]%}$(perlbrew use | sed ''s/^.*perl-/p/'')%{$reset_color%}'

# local hist_num='%{$fg_bold[black]%}(%h)%{$reset_color%}'
# local prompt_char='%{$fg_bold[black]%}$%{$reset_color%}'
local prompt_char='$'
local return_code='%(?..%{$fg[red]%}%? <<%{$reset_color%})'

PROMPT="
${user_host} ${date_time} ${perl_ver} ${ruby_ver} ${current_dir} ${git_branch}
${prompt_char} "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"




