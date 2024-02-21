export PROMPT="%F{cyan}%B%1~%b %# %F{white}"
export RPROMPT="%F{cyan}%T%f"

alias la="ls -a"
alias ll="ls -la"

# create a directory and cd to it
mcd() {
    mkdir -p "$1"
    cd "$1"
}

# list directories showing file type and name only
ln() {
    ll "$@" | awk '{ print substr($1,1,1) " " $9 " " $10 " " $11 }' | less
}

# list only the directories under the current directory
# optionally filter by part of the directory name
alias ldx="ln | grep '^d '"
ld() {
    [ -z $1 ] && ldx || ldx | grep -i $1
}

# remove all .DS_Store files system-wide
alias dsstore="sudo find / -name ".DS_Store" -depth -exec rm {} \;"

# fix 'file is in use' error
alias fix-in-use='SetFile -c "" -t ""'

# replace strings in files recursively
function replace() {
    sed -i '.bak' -e "s/$1/$2/g" $(find . -type f)
    find . -name "*.bak" -type f -delete
}

alias home="cd ~" 

# show the cd shortcuts defined below (they are easy to forget)
shortcuts() {
    echo 'cd shortcuts:'
    echo 'courses    - cd to Pluralsight Courses directory'
    echo 'homeschool - cd to Homeschooling directory'
    echo 'liberty    - cd to Liberty Mutual FSE Program directory'
    echo 'projects   - cd to Projects directory'
}

# shortcuts to project directories
export PROJECTS_DIR="$HOME/Documents/Projects"
alias courses="cd $PROJECTS_DIR/pluralsight/Courses"
alias homeschool="cd $PROJECTS_DIR/homeschooling"
alias liberty="cd $PROJECTS_DIR/pluralsight/Liberty\ Mutual\ 2022"
alias projects="cd $PROJECTS_DIR"
alias state="cd $PROJECTS_DIR/state"

# show the mathrutech shortcuts
mathru() {
    echo 'mathrutech shortcuts:'
    echo 'dbad03 - connect as DBAD03 (LPAR with FileManager installed)'
    echo 'mateva - connect as MATEVA (LPAR with basic environment)'
    echo 'mathrutech - cd to innov-mathrutech project directory'
    echo 'zos-samples - cd to innov-zos-samples project directory'
}

# shortcuts for Innovation in Software z/OS training assets 
alias dbad03="/opt/homebrew/Cellar/x3270/4.3ga4/bin/c3270 23.229.8.212:3275"
alias mateva="/opt/homebrew/Cellar/x3270/4.3ga4/bin/c3270 23.229.8.213:8723"
alias mathrutech="cd $PROJECTS_DIR/innov-mathrutech"
alias zos-samples="cd $PROJECTS_DIR/innov-zos-samples"

# show the git shortcuts 
galias() {
    echo 'git shortcuts:'
    echo 'gs="git status"'
    echo 'ga="git add"'
    echo 'gc="git commit -a"'
    echo 'gl="git log" (formatted)'
}

# git shortcuts 
alias gs="git status" 
alias ga="git add"
alias gc="git commit -m"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# get current local weather forecast (must be online)
weather() {
    clear
    curl wttr.in/tucson
}

PATH="/opt/homebrew/opt/ruby@3.0/bin:$PATH"
export PATH
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# bun completions
[ -s "/Users/davidnicolette/.bun/_bun" ] && source "/Users/davidnicolette/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
