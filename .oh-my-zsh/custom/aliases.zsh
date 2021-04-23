# Docker
alias d='docker'
alias dps="docker ps --format 'table {{.ID}} \t {{.Image}} \t {{.Names}} \t {{.Command}} \t {{.Status}}'"
alias dc='docker-compose'
alias container_clean='docker rm $(docker ps -a -q)'
alias container_kill='docker kill $(docker ps -a -q)'

# K8s
alias k="kubectl"
alias kg="kubectl get"

# GIT
alias gst='git status'
alias gc='git commit -s -m'
alias gpick='git cherry-pick $1'
alias gcm="git commit -m '$(curl -s http://whatthecommit.com/index.txt)'"
alias git-fork-update='git fetch upstream && git checkout master && git rebase upstream/master && git push origin master'
alias gg="cd $HOME/go/src/github.com/gauravgahlot/"
alias eyep="cd $HOME/go/src/github.com/gauravgahlot/eyep-tables"


# Packet
alias cacher="cd $HOME/go/src/github.com/gauravgahlot/cacher"
alias boots="cd $HOME/go/src/github.com/gauravgahlot/boots"
alias tink="cd $HOME/go/src/github.com/gauravgahlot/tink"
alias osie="cd $HOME/go/src/github.com/gauravgahlot/osie"
alias hegel="cd $HOME/go/src/github.com/gauravgahlot/hegel"
alias torg="cd $HOME/go/src/github.com/gauravgahlot/tinkerbell.org"


# Upbound
alias paws="cd $HOME/go/src/github.com/gauravgahlot/provider-aws"
alias cdocs="cd $HOME/go/src/github.com/gauravgahlot/crossplane"

# Others
alias bci="brightness-controller -inc $1"
alias bcd="brightness-controller -desc $1"
alias cluster-reset="~/k8s/cluster-reset/reset.sh"
alias kix="cd $HOME/go/src/github.com/kubnix/"

# vagrant
alias v="vagrant"
alias vup="vagrant up $1"
alias vsh"vagrant ssh $1"

