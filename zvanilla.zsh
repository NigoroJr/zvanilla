#!/usr/bin/env zsh

typeset -gx ZVANILLA_DIR

local dir="${TMPDIR:-.}"
local shell=${SHELL:-/bin/zsh}
local zshrc=${1:-$HOME/.zshrc}

while getopts 'hs:t:' flag; do
    case "$flag" in
        s)
            shell=$OPTARG
            ;;
        t)
            dir=$OPTARG
            ;;
        h)
            echo "Usage: $0 [-h] [-s <shell command>] [-t <tmpdir>] <zshrc>"
            exit 0
    esac

done
shift $(( $OPTIND - 1 ))

ZVANILLA_DIR=${"$( mktemp -d "$dir/zvanilla_XXXX" )":A}

if [[ -n $zshrc ]]; then
    cp $zshrc $ZVANILLA_DIR/.zshrc
fi
ZDOTDIR=$ZVANILLA_DIR $shell

rm -rf $ZVANILLA_DIR
