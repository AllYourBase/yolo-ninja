# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$fg[blue]%}%n@%m%{$reset_color%}'
local current_dir='%{$fg[blue]%}%~%{$reset_color%}'
local date_time='%{$fg[blue]%}%D{%Y-%m-%d %T}%{$reset_color%}'
local prompt_char='%{$fg_bold[black]%}>%{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)  $(git_prompt_status)%{$reset_color%}'

PROMPT="
${user_host}  ${date_time}  ${current_dir}  ${git_branch}
${prompt_char} "
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



# # custom zsh theme
# # based on elements of frisk and dieter

# PROMPT='
# $CURR_DIR '\
# '%{$fg[yellow]%}[%n@%m]%{$reset_color%} '\
# '%{$fg[blue]%}%D{%c}%{$reset_color%} '\
# '$(git_prompt_info)%{$bold_color%}$(git_prompt_status)%{$reset_color%} '\
# '
# $PROMPT2'
# # %{$fg_bold[black]%}>%{$reset_color%} '

# #mine
# # elaborate exitcode on the right when >0
# local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# RPS1="${return_code}"

# CURR_DIR="$fg[blue]%/$reset_color"
# GIT_PROMPT="$(git_prompt_info)$(git_prompt_status)"
# PROMPT2="$fg_bold[black]> $reset_color"

# GIT_CB=""
# ZSH_THEME_SCM_PROMPT_PREFIX="$fg[green]<"
# ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
# ZSH_THEME_GIT_PROMPT_SUFFIX="$fg[green]> "
# # ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
# #ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
# #ZSH_THEME_GIT_PROMPT_CLEAN=""

# # Modify Git prompt
# #ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[green]%}"
# #ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY=""
# ZSH_THEME_GIT_PROMPT_CLEAN=""

# # ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
# # ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}▲ "
# # ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
# # ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}➜ "
# # ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}═ "
# # ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}! "

# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[magenta]%}!"
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}>"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}#"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"


