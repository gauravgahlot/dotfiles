# Docker
alias d='docker'
# alias dps="docker ps --format 'table {{.ID}} \t {{.Image}} \t {{.Names}} \t {{.Command}} \t {{.Status}}'"
# alias dc='docker compose'
# alias drm='docker rm $(docker ps -a -q)'
# alias dkill='docker kill $(docker ps -a -q)'
# alias dprune='docker system prune -af && docker volume prune -af && docker buildx prune -af'

# K8s
alias k="kubectl"
alias kg="kubectl get"
# alias kgpo="kubectl get pods"
# alias kgno="kubectl get nodes"
# alias kgpoa="kubectl get pods --all-namespaces"
alias kd="kubectl describe"
# alias kaf="kubectl apply -f"
# alias kgy="kubectl get -o yaml"
# alias kprom='kubectl port-forward svc/prometheus-operated -n kaas-metrics 9090:9090 &'
# alias kx='kubectx'
# alias kns='kubens'

# hack for using whatthecommit
gcm() {
	msg=$(curl -s https://whatthecommit.com/index.txt)
	git commit -S --signoff -m $msg
}

# GIT
alias gp='git pull'
alias gst='git status'
alias ga='git add'
alias gcb="git checkout -b $1"
alias gco="git checkout $1"
alias gc='git commit -S --signoff -m'
alias gpick="git cherry-pick $1"
# alias gcm_old="git commit -s -m '$(curl -s http://whatthecommit.com/index.txt)'"
alias gfu='git fetch upstream && git checkout master && git rebase upstream/master && git push origin master'
alias gfum='git fetch upstream && git checkout main && git rebase upstream/main && git push origin main'
alias gra='git remote add'
alias gd="git branch -D $1"

# tmux
# alias t=tmux
# alias tns="tmux new -s $1"
# alias td='tmux detach'
# alias ta="tmux attach -t $1"
# alias tks='tmux kill-session'

alias pip=pip3
alias cat='bat --theme gruvbox-dark'

# wasm
alias hx='xxd -c4 -R always $1'

