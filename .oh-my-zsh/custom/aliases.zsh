# Docker
alias d='docker'
alias dps="docker ps --format 'table {{.ID}} \t {{.Image}} \t {{.Names}} \t {{.Command}} \t {{.Status}}'"
alias dc='docker-compose'
alias drm='docker rm $(docker ps -a -q)'
alias dkill='docker kill $(docker ps -a -q)'

# K8s
alias k="kubectl"
alias kg="kubectl get"
alias kgpo="kubectl get pods"
alias kgno="kubectl get nodes"
alias kgpoa="kubectl get pods --all-namespaces"
alias kd="kubectl describe"
alias kaf="kubectl apply -f"
alias kind-create='kind create cluster --config ~/workspace/k8s/cluster-config.yaml'

# hack for using whatthecommit
gcm() {
	msg=$(curl -s http://whatthecommit.com/index.txt)
	git commit -s -m $msg
}

# GIT
alias gp='git pull'
alias gst='git status'
alias ga='git add'
alias gcb="git checkout -b $1"
alias gco="git checkout $1"
alias gc='git commit -s -m'
alias gpick="git cherry-pick $1"
# alias gcm_old="git commit -s -m '$(curl -s http://whatthecommit.com/index.txt)'"
alias gfu='git fetch upstream && git checkout master && git rebase upstream/master && git push origin master'
alias gfum='git fetch upstream && git checkout main && git rebase upstream/main && git push origin main'
alias gra='git remote add'
alias gd="git branch -D $1"

alias gg="cd $HOME/go/src/github.com/gauravgahlot/"
alias acq="cd $HOME/go/src/github.com/acquia/"
alias tink="cd $HOME/go/src/github.com/gauravgahlot/tink"
alias tinkd="cd $HOME/go/src/github.com/gauravgahlot/tinkerbell-dashboard"
alias kix="cd $HOME/go/src/github.com/kubnix/"
alias gin="cd $HOME/workspace/gauravgahlot.in/"

alias f='fission'
alias fenv='fission environment'

# vagrant
alias v='vagrant'
alias vup="vagrant up $1"
alias vsh="vagrant ssh $1"

# dotnet
alias .net='dotnet'

# monitor
alias xa='xrandr --auto'
alias xo='xrandr --output eDP1 --off'

alias pip=pip3
alias tf=terraform
alias ctx=kubectx

