# ~/.zlogin is sourced on start of a login shell. If we've set zsh to be the
# default shell for our user, then this is where we tell zsh to launch fbterm
# so we can use the framebuffer /dev/fb0 to allow enhanced colors and fonts in
# tty. 
#
# Make sure the user is added to group "video" or else fbterm falls back
# to VESA which requires root and this fails.
#
# Detect fbterm
if [[ -x `which fbterm` ]]; then
    HAS_FBTERM=1
fi

# Detect if in tty or xterm
if [[ $(tty|grep -o '/dev/tty') = /dev/tty ]]; then
    IN_TTY=1
fi

# if in TTY, and has fbterm, use it!
if [[ $HAS_FBTERM = 1 ]] && [[ $IN_TTY = 1 ]]; then
    export FBTERM=1
    exec fbterm
fi
# Check and set virtualenv env-vars on load for edge cases. All other checks
# happen when `cd` is run
meta_project_check
