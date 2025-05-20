#!/bin/bash

usage() {
    echo "Error: Invalid number of arguments."
    echo "Usage: audio [command] [arguments(optional)]"
    echo "commands:"
    echo "  test                   : test audio output"
    exit 1
}

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

script_path=$(realpath "$0")
script_dir=$(dirname "$script_path")
audio_tool_dir=$(dirname "$script_dir")

source "$audio_tool_dir/config.sh"



case "$1" in
    test)
        . $script_dir/test.sh
        ;;

    *)
        echo "Invalid command: $1"
        usage
        ;;
esac