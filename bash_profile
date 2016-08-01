# Prompt
# git_branch() {
#   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }

# export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export PS1="\e[0;36m\]\u:\e[0;32m\]\$(git_branch)\e[1;33m\] \w \e[m\n$ "
# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad

# Load privates
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

# General
export ALTERNATE_EDITOR=""
export EDITOR=vim
alias ls='ls -GFh'
alias resource='source $HOME/.bash_profile'
alias cdot='cd ~/.dotfiles'

# Vim
if [ -f /usr/local/bin/nvim ]; then
  alias vim='/usr/local/bin/nvim'
elif [ -f /usr/local/bin/vim ]; then
  alias vim='/usr/local/bin/vim'
fi
alias ctags="ctags -R --exclude=.git --exclude=log $1"

# Tmux
alias tmls='tmux list-sessions'
alias tmks='tmux kill-session -t'

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Elixir/Phoenix
alias iexm='iex -S mix'
alias mps='mix phoenix.server'
alias mpr='mix phoenix.routes'

# Docker
alias dm='docker-machine'
alias dmcrt='docker-machine create --driver virtualbox default'
alias dc='docker-compose'
alias drm='docker rm'
alias dps='docker ps'
alias dpa='docker ps -a'
alias dka='docker kill $(docker ps -a -q)'
alias dra='docker rm $(docker ps -a -q)'

dmenv () {
  eval $(docker-machine env ${1:-default})
}

dmcdo () {
  docker-machine create -d digitalocean --digitalocean-access-token $DOTOK --digitalocean-image ubuntu-16-04-x64 $1
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Node
export PATH="$HOME/.node/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Functions
weather () {
  curl http://wttr.in/${1:-34695}
}

genv () {
  if [ $1 ]; then
    printenv | grep $1
  else
    printenv
  fi
}
