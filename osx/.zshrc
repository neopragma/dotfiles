export PROMPT="%F{cyan}%B%1~%b %# %F{white}"
export RPROMPT="%F{cyan}%T%f"

alias la="ls -a"
alias ll="ls -la"

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

# show the cd shortcuts defined below (they are easy to forget)
shortcuts() {
    echo 'cd shortcuts:'
    echo 'courses    - cd to Pluralsight Courses directory'
    echo 'homeschool - cd to Homeschooling directory'
    echo 'liberty    - cd to Liberty Mutual FSE Program directory'
    echo 'projects   - cd to Projects directory'
}

export PROJECTS_DIR="$HOME/Documents/Projects"
alias courses="cd $PROJECTS_DIR/pluralsight/Courses"
alias homeschool="cd $PROJECTS_DIR/homeschooling"
alias liberty="cd $PROJECTS_DIR/pluralsight/Liberty\ Mutual\ 2022"
alias projects="cd $PROJECTS_DIR"
alias state="cd $PROJECTS_DIR/state"

# get current local weather forecast (must be online)
weather() {
    clear
    curl wttr.in/tucson
}

# prevent the orange dot from appearing in videos made with the external microphone active
undot() {
    pushd "$HOME/Documents/Projects/undot/"
    open .
    ps -e | grep undot
    popd
}export PATH="/opt/homebrew/opt/ruby@3.0/bin:$PATH"
