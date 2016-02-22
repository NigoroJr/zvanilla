#!/usr/bin/env zsh

typeset -gx ZVANILLA_DIR

local dir="${TMPDIR:-.}"
local keep=false
local shell=${SHELL:-/bin/zsh}
local zshrc=${1:-$HOME/.zshrc}

while getopts 'hs:t:' flag; do
    case "$flag" in
        k)
            keep=true
            ;;
        s)
            shell=$OPTARG
            ;;
        t)
            dir=$OPTARG
            ;;
        h)
            echo "Usage: $0 [-h] [-k] [-s <shell command>] [-t <tmpdir>] <zshrc>"
            exit 0
    esac

done
shift $(( $OPTIND - 1 ))

ZVANILLA_DIR=${"$( mktemp -d "$dir/zvanilla_XXXX" )":A}

if [[ -n $zshrc ]]; then
    cp $zshrc $ZVANILLA_DIR/.zshrc
fi
ZDOTDIR=$ZVANILLA_DIR $shell

if ! $keep; then
    rm -rf $ZVANILLA_DIR
fi
