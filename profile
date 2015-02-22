#
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}\007"'

# got have vi
set -o vi

# make my life easier aliases
alias ll="ls -l"
alias x="exit"
alias til="dig +short +search"
alias myip='curl -s ipinfo.io | grep ip | cut -d\" -f4'
alias localip="ifconfig | awk '/en0:/,/status: active/' | grep inet | grep -v inet6| awk '{print $2}'"

# homebrew
alias binstall="brew install"
alias bcinstall="brew cask install"

# git
alias gcl='git clone'
alias gst='git status'
alias gco='git checkout'
alias gadd='git add'
alias gcm='git commit'
alias gpo='git push origin'
alias goops='git reset --soft HEAD~1'
alias gff='git merge --ff-only'
alias grefresh='git fetch; git merge --ff-only'

# puppet
alias puppet-librarian='librarian-puppet'

# Vagrant aliases
alias vagrant_startover='vagrant destroy -f; vagrant up'

# functions
function repos() { cd ~/github/"$@"; }
function devops() { cd ~/github/phishme/devops/"$@"; }
function triage() { cd ~/github/phishme/triage/"$@"; }

export PATH="$PATH:$HOME/.rvm/bin:$HOME/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
