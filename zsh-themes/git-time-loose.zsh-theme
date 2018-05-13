# ZSH theme

local user_host='%{$fg[cyan]%}%n@%m%{$reset_color%}'
# local current_dir='%{$fg[cyan]%}${PWD/#$HOME/~}%{$reset_color%}'
# Swap `~` for $HOME and only show last two components of path
local current_dir='%{$fg[cyan]%}%2~%{$reset_color%}'
# local date_time='%{$fg[blue]%}%D{%Y-%m-%d %T}%{$reset_color%}'
local date_time='%{$fg[cyan]%}%D{%T}%{$reset_color%}'
local git_branch='$(git_prompt_info) $(git_prompt_status)%{$reset_color%}'
# local ruby_ver='%{$fg[red]%}r$(rbenv version-name)%{$reset_color%}'
# local perl_ver='%{$fg[blue]%}'"$(perl -v | perl -nle 's{^.*v(\d+[.]\d+[.]\d+).*}{p$1}xmsg && print;')"'%{$reset_color%}'

# local hist_num='%{$fg_bold[black]%}(%h)%{$reset_color%}'
# local prompt_char='%{$fg_bold[black]%}$%{$reset_color%}'
local prompt_char='$'
local return_code='%(?..%{$fg[red]%}%? <<%{$reset_color%})'
NEWLINE=$'\n'

function battery_charge {
    local charge=$($HOME/bin/batcharge.py)
    echo "$charge" 2>/dev/null
}

function perl_ver {
    local version=$(perl -v | perl -nle 's{^.*v(\d+[.]\d+[.]\d+).*}{p$1}xmsg && print;')
    echo "%{$fg[blue]%}${version}%{$reset_color%}" 2>/dev/null
}

function ruby_ver {
    local version=$(rbenv version-name)
    echo "%{$fg[red]%}r${version}%{$reset_color%}" 2>/dev/null
}

PROMPT="${NEWLINE}${user_host} ${date_time} $(battery_charge) ${current_dir} ${git_branch}${NEWLINE}${prompt_char} "
RPROMPT=${return_code}

# Update BATT_CHG every 60 seconds
# periodic() {
#     export PROMPT="${NEWLINE}${user_host} ${date_time} $(battery_charge) ${current_dir} ${git_branch}${NEWLINE}${prompt_char} ";
# }
# PERIOD=60

# update BATT_CHG before each command prompt
precmd() {
    export PROMPT="${NEWLINE}${user_host} ${date_time} $(battery_charge) ${current_dir} ${git_branch}${NEWLINE}${prompt_char} ";
}


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
