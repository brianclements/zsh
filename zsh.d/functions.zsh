# -------------------------------------------------------------------
# compressed file expander 
# (from https://github.com/myfreeweb/zshuery/blob/master/zshuery.sh)
# -------------------------------------------------------------------
ex() {
    if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xvjf $1;;
          *.tar.gz) tar xvzf $1;;
          *.tar.xz) tar xvJf $1;;
          *.tar.lzma) tar --lzma xvf $1;;
          *.bz2) bunzip $1;;
          *.rar) unrar $1;;
          *.gz) gunzip $1;;
          *.tar) tar xvf $1;;
          *.tbz2) tar xvjf $1;;
          *.tgz) tar xvzf $1;;
          *.zip) unzip $1;;
          *.Z) uncompress $1;;
          *.7z) 7z x $1;;
          *.dmg) hdiutul mount $1;; # mount OS X disk images
          *) echo "'$1' cannot be extracted via >ex<";;
    esac
    else
        echo "'$1' is not a valid file"
    fi
}

# -------------------------------------------------------------------
# any function from http://onethingwell.org/post/14669173541/any
# search for running processes
# -------------------------------------------------------------------
any() {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any " >&2 ; return 1
    else
        ps xauwww | grep -i --color=auto "[${1[1]}]${1[2,-1]}"
    fi
}

# -------------------------------------------------------------------
# display a neatly formatted path
# -------------------------------------------------------------------
path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}

# -------------------------------------------------------------------
# display a neatly formatted python path
# -------------------------------------------------------------------
pypath() {
  echo $PYTHONPATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}
# -------------------------------------------------------------------
# Mac specific functions
# -------------------------------------------------------------------
if [[ $IS_MAC -eq 1 ]]; then

    # view man pages in Preview
    pman() { ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ; }

    # function to show interface IP assignments
    ips() { foo=`/Users/mark/bin/getip.py; /Users/mark/bin/getip.py en0; /Users/mark/bin/getip.py en1`; echo $foo; } 

    # notify function - http://hints.macworld.com/article.php?story=20120831112030251
    notify() { automator -D title=$1 -D subtitle=$2 -D message=$3 ~/Library/Workflows/DisplayNotification.wflow }
fi

# -------------------------------------------------------------------
# nice mount (http://catonmat.net/blog/another-ten-one-liners-from-commandlingfu-explained)
# displays mounted drive information in a nicely formatted manner
# -------------------------------------------------------------------
function nicemount() { (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1') | column -t ; }

# -------------------------------------------------------------------
# myIP address
# -------------------------------------------------------------------
function myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
  ifconfig eth0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig eth0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# -------------------------------------------------------------------
# (s)ave or (i)nsert a directory.
# -------------------------------------------------------------------
s() { pwd > ~/.save_dir_"$1" ; }
i() { cd "$(cat ~/.save_dir_"$1")" ; }
c() { rm ~/.save_dir_"$1" ; }
l() { ls ~/.save* && echo -n '\n' && cat $(ls ~/.save*) ; }


# -------------------------------------------------------------------
# console function
# -------------------------------------------------------------------
function console () {
  if [[ $# > 0 ]]; then
    query=$(echo "$*"|tr -s ' ' '|')
    tail -f /var/log/syslog|grep -i --color=auto -E "$query"
  else
    tail -f /var/log/syslog
  fi
}

# -------------------------------------------------------------------
# shell function to define words
# http://vikros.tumblr.com/post/23750050330/cute-little-function-time
# -------------------------------------------------------------------
givedef() {
  if [[ $# -ge 2 ]] then
    echo "givedef: too many arguments" >&2
    return 1
  else
    curl "dict://dict.org/d:$1"
  fi
}

# -------------------------------------------------------------------
# mkdir and cd into it
# https://coderwall.com/p/-cycbq
# -------------------------------------------------------------------
function mkdircd () {
    mkdir -p "$@" && cd "$@"
}

# -------------------------------------------------------------------
# check for truecrypt mounts
# -------------------------------------------------------------------
tc_is_mounted() {
    if [[ -d /media/truecrypt1 ]]; then
        true
    else 
        echo "Warning: no truecrypt mounts detected"
        false
    fi
}

# -------------------------------------------------------------------
# ssh wrapper to update tmux window
# http://wojtek.ziniewi.cz/2014/03/10/auto-tmux-ssh-hostname-window-title-that-actually-works/
# http://stackoverflow.com/questions/1853946/getting-the-last-argument-passed-to-a-shell-script
# -------------------------------------------------------------------
ssh() {
    tc_is_mounted
    tmux rename-window "${@: -1}"
    command ssh "$@"
    tmux rename-window "ssh"
}


# -------------------------------------------------------------------
# check if PWD is part of meta project for virtualenvwrapper, change env-vars
# accordingly if so.
# http://superuser.com/questions/538877/get-the-parent-directory-for-a-file
# -------------------------------------------------------------------
meta_project_check() {
    if [[ -d .git ]]; then
        this_folder="${PWD##*/}"
        parent_path="$(dirname $PWD)"
        parent_folder="${parent_path##*/}"
        if [[ "$this_folder" == "$parent_folder" ]]; then
            export WORKON_HOME="${parent_path}/venv/"
            export PROJECT_HOME="$(dirname $PWD)"
        fi
    else
        export WORKON_HOME=$HOME/.virtualenvs
        export PROJECT_HOME=$HOME/dev
    fi
}


# -------------------------------------------------------------------
# Get name of git project
# http://stackoverflow.com/questions/15715825/how-do-you-get-git-repos-name-in-some-git-repository
# -------------------------------------------------------------------
git_project_name() {
    if [[ -d .git ]]; then
        basename `git rev-parse --show-toplevel` 
    fi
}

# -------------------------------------------------------------------
# Pull/refresh frequently used base docker images
# -------------------------------------------------------------------
dk_update_base_images() {
    do_update() {
        if ! $(/usr/bin/touch /var/run/docker.sock 2> /dev/null); then
            sudo true
            for i in "${iList[@]}"; do
                sudo docker pull "${i}" &
            done
        else
            for i in "${iList[@]}"; do
                docker pull "${i}" &
            done
        fi
    }
    iList=("radial/distro:us-west-1" "radial/axle-base" "radial/hub-base" "radial/spoke-base" "radial/admin")
    do_update
    iList=("$@")
    do_update
}

# -------------------------------------------------------------------
# Quickly remove offending key in known_hosts
# -------------------------------------------------------------------

rm_known_host_key() {
    sed -i "$1"d $HOME/.ssh/known_hosts
}

# -------------------------------------------------------------------
# Quickly start docker admin container
# -------------------------------------------------------------------

start_docker_admin() {
    args=("$@")
    cmmds=("${args[@]:1}")
    docker run -it --rm --volumes-from "${args[1]}"_hub_1 --name "${args[1]}"_admin radial/admin "$cmmds"
}
