# checks (stolen from zshuery)
if [[ $(uname) = 'Linux' ]]; then
    IS_LINUX=1
fi

if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
fi

if [[ -x `which brew` ]]; then
    HAS_BREW=1
fi

if [[ -x `which apt-get` ]]; then
    HAS_APT=1
fi

if [[ -x `which yum` ]]; then
    HAS_YUM=1
fi

if [[ -x `which fbterm` ]]; then
    HAS_FBTERM=1
fi

if [[ $(tty|grep -o '/dev/tty') = /dev/tty ]]; then
    IN_TTY=1
fi

# Check for truecrypt mounts
crypt_is_mounted
