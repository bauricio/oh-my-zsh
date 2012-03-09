local start_mark='%{$fg[blue]%}$%{$reset_color%}'
local pwd='%{$fg[green]%}%~%{$reset_color%}'
local prompt_separator='%{$fg[red]%}:'
local rvm=''
if which rvm-prompt &> /dev/null; then
  rvm='%{$fg[green]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm='%{$fg[green]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}a "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}m "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}d "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}r "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}um "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}ut "

PROMPT="${start_mark} ${pwd} ${prompt_separator} "
RPROMPT="${return_code} ${git_branch} ${rvm}"
