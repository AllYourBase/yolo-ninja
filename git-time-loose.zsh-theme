# custom zsh theme
# based on elements of frisk and dieter

PROMPT='
$CURR_DIR '\
'$(git_prompt_info)%{$bold_color%}$(git_prompt_status)%{$reset_color%} '\
'%{$fg[yellow]%}[%n@%m]%{$reset_color%} '\
'%{$fg[blue]%}%D{%c}%{$reset_color%}
$PROMPT2'
# %{$fg_bold[black]%}>%{$reset_color%} '

#mine
# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

RPS1='${return_code}'

CURR_DIR="$fg[blue]%/$reset_color"
GIT_PROMPT="$(git_prompt_info)$(git_prompt_status)"
PROMPT2="$fg_bold[black]> $reset_color"

GIT_CB="git::"
ZSH_THEME_SCM_PROMPT_PREFIX="$fg[green]["
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
ZSH_THEME_GIT_PROMPT_SUFFIX="$fg[green]] "
# ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
#ZSH_THEME_GIT_PROMPT_CLEAN=""

# Modify Git prompt
#ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[green]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}▲ "
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}➜ "
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}═ "
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}! "

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[magenta]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"


