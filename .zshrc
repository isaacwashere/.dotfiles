# TODO: Clean up this file so it's neater
###############################################################################
#                               DA DOTFILES                                   #
#                                                                             #
#                                                                             #
###############################################################################

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="/Users/isaac/.oh-my-zsh"

export PATH="/usr/local/sbin:$PATH"

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NODE_ENV="development"

# include Z
. ~/z.sh

# Set name of the theme to load
# ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true
SPACESHIP_PROMPT_ORDER=(
  user          # Username seclstion
  time          # Time stamps section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # docker        # Docker section
  exec_time     # Execution time
  node          # Node.js section
  ruby          # Ruby section
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

plugins=(
  z
  zsh-autosuggestions
  brew
  yarn
  ruby
)

source $ZSH/oh-my-zsh.sh

# Prevail
alias prevail-webpack="./bin/webpack-dev-server"
alias prevail-server="aws-vault exec prevail --duration=12h -- bundle exec rails s"

# General
alias hs='history | grep'
alias myip="curl http://ipecho.net/plain; echo"
alias show-ports="lsof -i -P | grep -i \"listen\""
alias cl="clear"
alias cz="code ~/.zshrc"
alias sz="source ~/.zshrc"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# VSCODE
alias ci="code-insiders"
alias c="code"

# Emacs
alias e="open -a Emacs"
alias emacs="open -a Emacs"
alias doom="~/doom-emacs/bin/doom"
alias switch-emacs="switch-emacs-profile"
alias whoisemacs="which-emacs-profile" 
alias doom-term="Emacs --with-profile doom"
alias spacemacs-term="Emacs --with-profile spacemacs"

# GIT
alias g-s="git status"
alias g-d="git diff"
alias g-c="git checkout"

# NPM/YARN
alias ni="npm install"

# Ngrok
alias isaac-ngrok-80="ngrok http 80" 
alias isaac-ngrok-4000="ngrok http 4000"
alias isaac-ngrok-3000="ngrok http 3000" 

#Heroku
alias heroku-switch="heroku accounts:set"

#Docker Alias
alias dc="docker-compose"
alias dcr="docker-compose run"
alias dstop='docker stop $(docker ps -a -q)' # stops all docker containers
alias dprune="docker system prune -a" # deletes all stopped Docker images
alias dcpv="docker system prune --volumes" # deletes all stopped Docker volumes (usually databases)

mkc () {
  file=${1}
  mkdir $file && cd $file
}

append_path() {
  export PATH="$PATH:$1"
}

switch-emacs-profile() {
  profile=${1}
  if [ ! "$profile" ]
  then
    echo "ERROR: Please indicate an emacs profile"
  else
    truncate -s 0 ~/.emacs-profile
    echo ${profile} >> ~/.emacs-profile
    newProfile=`cat ~/.emacs-profile`
    echo "emacs profile is now set to: $newProfile"
  fi
}

which-emacs-profile() {
  cat ~/.emacs-profile
}

update-spacemacs() {
  cd ~/spacemacs && git pull && cd -
}

port-with() {
  portNumber=${1}
  # lsof -nP -iTCP:${portNumber} | grep LISTEN
  lsof -i :${portNumber}
}

term-port() {
  portToTerminate=${1}
  lsof -ti:${portToTerminate} | xargs kill
}

save-diff-to() {
  diffFileName=${1}
  git diff --color > ${diffFileName}.txt
  mv ${diffFileName}.txt ~/Desktop/diffs
}

view-saved-diff() {
  diffFileName=${1}
  cat ${diffFileName}
}

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export GPG_TTY=`tty`
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

source /Users/isaac/Documents/google-cloud-sdk/completion.zsh.inc
source /Users/isaac/Documents/google-cloud-sdk/path.zsh.inc

export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
. $HOME/.asdf/asdf.sh

export TERM=xterm-256color
eval "$(direnv hook zsh)"

export HEROKU_APP_NAME="Isaac"
alias dotfiles='/usr/bin/git --git-dir=/Users/isaac/.dotfiles/ --work-tree=/Users/isaac'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
