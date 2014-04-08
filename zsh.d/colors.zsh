autoload colors; colors

# The variables are wrapped in \%\{\%\}. This should be the case for every
# variable that does not contain space.
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
  eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
  eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

eval RESET='$reset_color'
export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE 
export PR_BOLD_WHITE PR_BOLD_BLACK

# Clear LSCOLORS
unset LSCOLORS

export CLICOLOR=1

# Main change, you can see directories on a dark background
#export tLSCOLORS=gxfxcxdxbxegedabagacad

LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32";
LSCOLORS="ExGxFxDxCxDxDxhbhdacEc";
# LSCOLORS=Gxfxcxdxbxegedabagacad # alt
# LS_COLORS=exfxcxdxbxegedabagacad # alt

# Do we need Linux or BSD Style?
if [[ $IS_LINUX -eq 1 ]]; then
    # Linux Style
    export LS_COLORS=$LS_COLORS
    alias ls='ls --color=auto -F'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    # BSD Style
    export LSCOLORS=$LSCOLORS
    alias ls='ls -G'
fi
