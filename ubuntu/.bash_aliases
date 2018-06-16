# Frequently used in development

alias help="lynx ~/help.html"
alias t="tail -f "
alias f="find . -name "

# Files and directories

alias ll="ls -lhFA"
alias lll="ls -lhFA | less"
alias ..="cd .."
alias l="less "
alias md="mkdir -pv "

mcd () {
  mkdir -pv "$1"
  cd "$1"
}

# System administration

alias df="df -Tha --total"
alias free="free -mt"
alias top="htop"
alias du="ncdu"
alias ps="ps aux | less"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias hist="history | less"
alias histg="history | grep "

