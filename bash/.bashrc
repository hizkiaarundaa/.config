eval "$(oh-my-posh init bash --config $POSH_THEMES_PATH/star.omp.json)"

# file/folder control
alias md='mkdir'
alias project='cd /d/Project'
alias home='cd ~/'
alias college='cd /d/College'
alias ll='ls -lah'
# git
alias g='git'
alias gaa='git add .'
alias gbr='git branch'
alias gch='git checkout'
alias gcl='git clone'
alias gcm='git commit -m'
alias glo='git log --oneline'
alias gpl='git pull'
alias gps='git push'
alias gst='git status'
#node
alias nd='npm run dev'
alias yd='yarn dev'
alias bd='bun dev'
alias pd='pnpm run dev'
# sass
alias scs='sass --watch .:dist/css/ --style=compressed'
# apk
alias chrome='/c/Program\ Files/Google/Chrome/Application/chrome.exe'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
