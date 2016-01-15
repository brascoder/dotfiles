# Prompt
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PS1="\e[0;36m\]\u:\e[0;32m\]\$(git_branch)\e[1;33m\] \w \e[m\n$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Load privates
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

# General
export ALTERNATE_EDITOR=""
export EDITOR=vim
alias ls='ls -GFh'

# Vim
if [ -f /usr/local/bin/vim ]; then
  alias vim='/usr/local/bin/vim'
fi

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#Node
export PATH="$HOME/.node/bin:$PATH"

# Docker
alias bdu='boot2docker up'
alias denv='$(boot2docker shellinit)'
alias drm='docker rm'
alias dps='docker ps'
alias dpa='docker ps -a'
alias dka='docker kill $(docker ps -a -q)'
alias dra='docker rm $(docker ps -a -q)'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcr='docker-compose run'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
