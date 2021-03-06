# -------------------------------------------------------------------
# use nocorrect alias to prevent auto correct from "fixing" these
# -------------------------------------------------------------------
#alias foobar='nocorrect foobar'
alias g8='nocorrect g8'

# -------------------------------------------------------------------
# Ruby stuff
# -------------------------------------------------------------------
alias ri='ri -Tf ansi' # Search Ruby documentation
alias rake="noglob rake" # necessary to make rake work inside of zsh
#alias be='bundle exec'
#alias bx='bundle exec'
#alias gentags='ctags .'

# -------------------------------------------------------------------
# directory movement
# -------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias 'bk=cd $OLDPWD'

# -------------------------------------------------------------------
# directory information
# -------------------------------------------------------------------

alias lh='ls -Fd .*' # show hidden files/directories only
alias ll='ls -Fhal'

alias 'dus=du -sckx * | sort -nr' #directories sorted by size

alias 'wordy=wc -w * | sort | tail -n10' # sort files in current directory by the number of words they contain
alias 'filecount=find . -type f | wc -l' # number of files (not directories)

# -------------------------------------------------------------------
# Mac only
# -------------------------------------------------------------------
if [[ $IS_MAC -eq 1 ]]; then
    alias ql='qlmanage -p 2>/dev/null' # OS X Quick Look
    alias oo='open .' # open current directory in OS X Finder
    alias 'today=calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
    alias 'mailsize=du -hs ~/Library/mail'
    alias 'smart=diskutil info disk0 | grep SMART' # display SMART status of hard drive
    # Hall of the Mountain King
    alias cello='say -v cellos "di di di di di di di di di di di di di di di di di di di di di di di di di di"'
    # alias to show all Mac App store apps
    alias apps='mdfind "kMDItemAppStoreHasReceipt=1"'
    # reset Address Book permissions in Mountain Lion (and later presumably)
    alias resetaddressbook='tccutil reset AddressBook'
    # refresh brew by upgrading all outdated casks
    alias refreshbrew='brew outdated | while read cask; do brew upgrade $cask; done'
    # rebuild Launch Services to remove duplicate entries on Open With menu
    alias rebuildopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.fram ework/Support/lsregister -kill -r -domain local -domain system -domain user'
fi


# -------------------------------------------------------------------
# remote machines
# -------------------------------------------------------------------
alias 'palantir=ssh mhn@palantir.ome.ksu.edu -p 11122'
alias 'pvnc=open vnc://palantir.ome.ksu.edu'
alias 'ksunix=ssh mhn@unix.ksu.edu'
alias 'veld=ssh mhn@veld.ome.ksu.edu'
alias 'dev=ssh mhn@ome-dev-as1.ome.campus'
alias 'wf=ssh markn@markn.webfactional.com'

# -------------------------------------------------------------------
# database
# -------------------------------------------------------------------
alias 'psqlstart=/usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l logfile start'
alias 'psqlstop=/usr/local/pgsql/bin/pg_ctl stop'
#alias mysql='mysql -u root'
#alias mysqladmin='mysqladmin -u root'

# -------------------------------------------------------------------
# ome devvm start, stop, ssh, and mount
# -------------------------------------------------------------------
alias 'startvm=VBoxHeadless --startvm devvm'
alias 'stopvm=VBoxManage controlvm devvm poweroff'
alias 'devvm=ssh -p 10022 ome@localhost'
alias 'devmount=mount_smbfs //ome:ch1cag0@localhost:10139/ome /Users/$USERNAME/Projects/devvm/'

# -------------------------------------------------------------------
# Mercurial (hg)
# -------------------------------------------------------------------
alias 'h=hg status'
alias 'hc=hg commit'
alias 'push=hg push'
alias 'pull=hg pull'
alias 'clone=hg clone'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gpl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gv='git log --pretty=format:'%s' | cut -d " " -f 1 | sort | uniq -c | sort -nr'

# leverage aliases from ~/.gitconfig
alias gh='git hist'
alias gt='git today'

# curiosities 
# gsh shows the number of commits for the current repos for all developers
alias gsh="git shortlog | grep -E '^[ ]+\w+' | wc -l"

# gu shows a list of all developers and the number of commits they've made
alias gu="git shortlog | grep -E '^[^ ]'"

# -------------------------------------------------------------------
# Python virtualenv 
# http://blog.doughellmann.com/2010/01/virtualenvwrapper-tips-and-tricks.html
# -------------------------------------------------------------------
alias python='python3'
alias v='workon'
alias v.d='deactivate'
alias v.mk='mkvirtualenv --python=/usr/bin/python3'
alias v.mk_withsitepackages='mkvirtualenv'
alias v.rm='rmvirtualenv'
alias v.switch='workon'
alias v.add2virtualenv='add2virtualenv'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'
# run ipython in virtualenv
# https://coderwall.com/p/xdox9a
alias v.ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# -------------------------------------------------------------------
# Python dev shortcuts
# -------------------------------------------------------------------
alias p.run='python -m $(git_project_name)'
alias p.test='python -m unittest -v'
alias p.coverage='coverage run --source blacksmith setup.py test && coverage report -m'

# -------------------------------------------------------------------
# tmuxifier
# -------------------------------------------------------------------
alias t='tmux'
alias t.a='tmux a -t'
alias t.s='tmuxifier load-session'
alias t.w='tmuxifier load-window'
alias t.l='tmuxifier list'
alias t.ls='tmuxifier list-sessions'
alias t.lw='tmuxifier list-windows'
alias t.ns='tmuxifier new-session'
alias t.nw='tmuxifier new-window'
alias t.es='tmuxifier edit-session'
alias t.ew='tmuxifier edit-window'


# -------------------------------------------------------------------
# directory saving
# -------------------------------------------------------------------
alias d.s='s'
alias d.i='i'
alias d.rm='c'
alias d.ls='l'

# -------------------------------------------------------------------
# docker shortcuts
# -------------------------------------------------------------------
alias docker.tmp='docker run -it --rm radial/distro:us-west-1'
alias docker.refresh='dk_update_base_images'
alias docker.admin='start_docker_admin'

# -------------------------------------------------------------------
# Oddball stuff
# -------------------------------------------------------------------
alias rm_key='rm_known_host_key'
alias 'sloc=/usr/local/sloccount/bin/sloccount'
alias 'adventure=emacs -batch -l dunnet' # play adventure in the console
alias 'ttop=top -ocpu -R -F -s 2 -n30' # fancy top
alias 'rm=rm -i' # make rm command (potentially) less destructive

alias irssi='TERM=screen-256color irssi'

# alias to cat this file to display
alias acat='< ~/.zsh/aliases.zsh'
alias fcat='< ~/.zsh/functions.zsh'
alias sz='source ~/.zshrc'

# -------------------------------------------------------------------
# some Octopress helpers
# -------------------------------------------------------------------
alias 'generate=date ; rake generate ; date ;'
alias 'gen=date ; rake generate ; date ;'
alias 'ingen=date ; rake integrate ; generate ; date ;'
alias 'deploy=rm deploy.log ; rake deploy > deploy.log ; tail -n 3 deploy.log ;'
alias 'np=newpost.rb'

# copy .htaccess files for zanshin.net and its image sub-directory
alias 'htaccess=scp /Users/mark/Projects/octopress/zanshin/source/htaccess/.htaccess markn@markn.webfactional.com:~/webapps/zanshin ; scp /Users/mark/Projects/octopress/zanshin/source/images/.htaccess markn@markn.webfactional.com:~/webapps/zanshin/images ;'

# deploy zanshin.net and move its .htaccess files
alias 'dz=deploy ; htaccess ;'
