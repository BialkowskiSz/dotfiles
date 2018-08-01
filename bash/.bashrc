source /usr/share/defaults/etc/profile

#   Repeat previous command with sudo
alias plz='sudo $(history -p \!\!)'


#   Use htop rather than top
alias top='htop'


#   Long list of everything
alias ll='ls -AlhF --color=auto'
#   List hidden
alias la='ls -A --color=auto'
#   Classify and list by column
alias l='ls -CF --color=auto'

#   Search for files
alias fhere='find . -name '


#   List IP
alias myip="curl http://ipecho.net/plain; echo"


#   History time format
export HISTTIMEFORMAT="%d/%m/%y %T "


#   Make cd quicker
alias cd..='cd ../'
alias ..='cd ../'


#   FUNCTIONS
mkdircd() {
    mkdir -p "$1"
    cd "$1"
 }

cdls() {
    cd "$1"
    ls
}

md5check () {
    md5sum "$1" | grep --color=auto "$2"
}

sha256check () {
    sha256sum "$1" | grep --color=auto "$2"
}

historygrep () {
    history | grep "$1"
}

extract() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#   List all contents of current directory sorted by size
sbsall() {
        du -b --max-depth 1 | \
        sort -nr | \
        perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';
}

#   List non-hidden directories of current directory sorted by size
sbs() { du -hsx * | sort -rh; }

up() {
    times=$1
    while [ "$times" -gt "0" ]; do
        cd ..
        times=$(($times - 1))
    done
}