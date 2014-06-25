# ~/.zlogin is sourced on start of a login shell. If we've set zsh to be the
# default shell for our user, then this is where we tell zsh to launch fbterm
# so we can use the framebuffer /dev/fb0 to allow enhanced colors and fonts in
# tty. 
#
# Make sure the user is added to group "video" or else fbterm falls back
# to VESA which requires root and this fails.

if [[ -x `which fbterm` ]]; then
    HAS_FBTERM=1
fi

if [[ $HAS_FBTERM = 1 ]] && [[ $(tty|grep -o '/dev/tty') = /dev/tty ]]; then
    fbterm
    exit
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Check and set virtualenv env-vars on load for edge cases. All other checks
# happen when `cd` is run
meta_project_check
