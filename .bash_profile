# Prompt
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PS1="\e[0;36m\]\u:\e[0;32m\]\$(git_branch)\e[1;33m\] \w \e[m\n$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# General
export ALTERNATE_EDITOR=""
export EDITOR=vim
alias ls='ls -GFh'

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Docker
alias denv='$(boot2docker shellinit)'
alias drm='docker rm'
alias dps='docker ps'
alias dc='docker-compose'
