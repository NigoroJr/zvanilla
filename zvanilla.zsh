#!/usr/bin/env zsh

function() {
    typeset -gx ZVANILLA_DIR

    local dir
    local shell
    local zshrc

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

    # Use TMPDIR or current directory
    : ${dir:=${TMPDIR:-.}}
    # Use $SHELL or /bin/zsh
    : ${shell:=${SHELL:-/bin/zsh}}

    ZVANILLA_DIR="$( mktemp -d "$dir/zvanilla_XXXX" )"
    zshrc="$1"

    if [[ -n $zshrc ]]; then
        cp $zshrc $ZVANILLA_DIR/.zshrc
    fi
    ZDOTDIR=$ZVANILLA_DIR $shell

    rm -r $ZVANILLA_DIR
} "$@"
