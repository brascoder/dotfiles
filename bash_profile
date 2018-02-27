# Load privates
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

# General
export ALTERNATE_EDITOR=""
export EDITOR="vi"
alias ls='ls -GFh'
alias resource='source $HOME/.bash_profile'
alias cdot='cd ~/.dotfiles'
alias sshfix='ssh-add -A'

# Vim
if [ -f /usr/local/bin/nvim ]; then
  alias vim='/usr/local/bin/nvim'
  export VISUAL=nvim
  # if [ -f /usr/local/bin/nvr ]; then
  #   export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
  # else
  #   export VISUAL=nvim
  # fi
elif [ -f /usr/local/bin/vim ]; then
  alias vim='/usr/local/bin/vim'
  export VISUAL=vim
fi

# Spacemacs
alias emd="emacs --daemon"
alias emc="emacsclient -c"

# Tmux
alias tmls='tmux list-sessions'
alias tmks='tmux kill-session -t'

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Elixir/Phoenix
alias iexm='iex -S mix'
alias mps='mix phx.server'
alias mpr='mix phx.routes'

# Docker
alias dm='docker-machine'
alias dmcrt='docker-machine create --driver virtualbox default'
alias dc='docker-compose'
alias dcr='docker-compose run --rm'
alias drm='docker rm'
alias dps='docker ps'
alias dpa='docker ps -a'
alias dsa='docker stop $(docker ps -a -q)'
alias dra='docker rm $(docker ps -a -q)'
alias dcdeploy="docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d"

dmenv () {
  eval $(docker-machine env ${1:--u})
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
  curl http://wttr.in/${1:-33763}
}

genv () {
  if [ $1 ]; then
    printenv | grep $1
  else
    printenv
  fi
}

fgco() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

frbi() {
  rbenv install $(rbenv install --list | FZF)
}

### AWS CLI Command Completion
# source /usr/local/bin/aws_zsh_completer.sh
