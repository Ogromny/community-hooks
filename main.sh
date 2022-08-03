#!/bin/sh -e
# Ogrommy <ogromnycoding@gmail.com>

BLUE="\033[0;34m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RESET="\033[0m"

log() {
    printf "$GREEN[Hook] $BLUE$1$RESET: executing $YELLOW$2$RESET\n"
}

if [ -z "$1" ]; then
    exit 0
fi

# main.sh base path (Hooks Working Directory)
HWD=$(dirname "$0")

if [ -d "$HWD/$1" ]; then
    for hook in $HWD/$1/*; do
        if [ -x "$hook" ]; then
            log "$1" "$(basename "$hook")"
            "$hook" "$@"
        fi
    done
fi
