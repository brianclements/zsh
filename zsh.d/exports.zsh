# Currently this path is appended to dynamically when picking a ruby version
# zshenv has already started PATH with rbenv so append only here
export PATH=$PATH~/usr/local/heroku/bin:/home/brian/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/brian/.rvm/bin:/home/brian/.rvm/bin

# Set default console Java to 1.6
# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home

# Set TERM for various conditions
case "$TERM" in
# use fbterm in tty
linux)
    if [[ $HAS_FBTERM = 1 ]]; then
        export TERM=fbterm
    fi
    ;;
# xterm-256color for everything in X
xterm*|rxvt*)
    export TERM=xterm-256color
    ;;
# zsh keys act strange in tmux when color-256color is set.
# disabling tmux's preference for TERM until fix is found.
color-256color)
    export TERM=xterm-256color
    ;;
*)
    ;;
esac

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='subl -w'

# Python envs
export PYTHONPATH=$HOME/dev

# export NODE_PATH=/opt/github/homebrew/lib/node_modules
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C 

# Dotfiles location
export DOTFILES=$HOME/.dotfiles

# export GH_ISSUE_CREATE_TOKEN=083f60c674d8eb41f98258df9fc8d94cb733218a

# Virtual Environment Stuff
#
# I don't see the logic in having my venvs in one location. Since they are
# application specific, I want to package them with my application. I also
# don't want to hunt them down if I wanted to package them with the source;
# they will already be there.
#
# The below assumes that PWD is the source code directory for a project. I tend
# to have my project source root inside of a "meta project" folder as such:
#
# project_meta_root
# ├── project_code_repo
# │   ├── project_code
# │   ├── dev-tmp
# │   ├── docs
# │   ├── scripts
# │   └── tests
# ├── project2_code_repo
# │   ├── project2_code
# │   ├── dev-tmp
# │   ├── docs
# │   ├── scripts
# │   └── tests
# ├── venv
# │   ├── project_venv
# │   └── project2_venv
# ├── wiki
# │   └── data
# └── www
#
# As a backup, sane default values are set when not in a project dir.
# Per-project checking available in `./functions.zsh`
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
export VIRTUALENVWRAPPER_HOOK_DIR=$DOTFILES/virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh 

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export EDITOR="vim"

