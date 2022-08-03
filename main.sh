#!/bin/sh -e
# Ogrommy <ogromnycoding@gmail.com>

BLUE="\033[0;34m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RESET="\033[0m"

log() {
    printf "$GREEN[Hook] $BLUE$1$RESET: executing $YELLOW$2$RESET\n"
}

# Thanks Dylan ❤️
# https://github.com/dylanaraps/pure-sh-bible#get-the-base-name-of-a-file-path
basename() {
    dir=${1%${1##*[!/]}}
    dir=${dir##*/}
    dir=${dir%"$2"}
    printf '%s\n' "${dir:-/}"
}

if [ ! -z "$1" ] && [ -d "./$1" ]; then
    for hook in ./$1/*; do
        if [ -x "$hook" ]; then
            log "$1" "$(basename "$hook")"
            "$hook" "$@"
        fi
    done
fi
