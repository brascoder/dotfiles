# Load privates
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# General
export ALTERNATE_EDITOR="vi"
alias ls='ls -GFh'
alias resource='source $HOME/.bash_profile'
alias cdot='cd ~/.dotfiles'
alias cdcode='cd ~/code'
alias sshfix='ssh-add -A'

# FZF
export FZF_DEFAULT_COMMAND='rg --files --follow --preview='

# Vim
if [ -f $HOME/.asdf/shims/nvim ]; then
  alias vim='$HOME/.asdf/shims/nvim'
  export EDITOR=nvim
  export VISUAL=nvim
elif [ -f /usr/local/bin/nvim ]; then
  alias vim='/usr/local/bin/nvim'
  export EDITOR=nvim
  export VISUAL=nvim
  # if [ -f /usr/local/bin/nvr ]; then
  #   export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
  # else
  #   export VISUAL=nvim
  # fi
elif [ -f /usr/local/bin/vim ]; then
  alias vim='/usr/local/bin/vim'
  export EDITOR=vim
  export VISUAL=vim
fi

# Spacemacs
alias emd="emacs --daemon"
alias emc="emacsclient -c"

# ASDF
alias update-nvim-nightly='asdf uninstall neovim nightly && asdf install neovim nightly'
alias update-nvim-stable='asdf uninstall neovim stable && asdf install neovim stable'

# ngrok
if [ -f $HOME/ngrok ]; then
  alias ngrok='$HOME/ngrok'
fi

# Elixir/Phoenix
alias iexm='iex -S mix'
alias mps='mix phx.server'
alias mpr='mix phx.routes'
export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl@1.1)"
export KERL_BUILD_DOCS="yes"

#Postgresql
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### AWS CLI Command Completion
# source /usr/local/bin/aws_zsh_completer.sh

# Functions
dmenv () {
  eval $(docker-machine env ${1:--u})
}

dmcdo () {
  docker-machine create -d digitalocean --digitalocean-access-token $DOTOK --digitalocean-image ubuntu-16-04-x64 $1
}

fgco() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

galias () {
  if [ $1 ]; then
    alias | grep $1
  else
    alias
  fi
}

genv () {
  if [ $1 ]; then
    printenv | grep $1
  else
    printenv
  fi
}

gh() {
  git config --get remote.origin.url | ruby -ne 'puts %{https://github.com/#{$_.split(/.com[\:\/]/)[-1].gsub(".git","")}}' | xargs open
}

weather () {
  curl http://wttr.in/${1:-33763}
}
