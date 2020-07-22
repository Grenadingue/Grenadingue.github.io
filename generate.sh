#!/bin/sh

set -e

theme=stackoverflow
script_dir="$(cd "$(dirname "${0}")" && pwd)"
export PATH="${PATH}:${PWD}/node_modules/.bin"

command_exists()
{
    command -v $1 >/dev/null 2>&1
}

if ! command_exists resume; then
    echo "Error: 'resume' command not found" >&2
    echo "Did you run `npm install`?" >&2
    exit 1
fi

if resume export resume.html --theme "${theme}"; then
    if ! mv -v resume.html index.html; then
        echo "Error: Rendered web page not found" >&2
        exit 1
    fi
else
    echo "Error: Web page rendering failure" >&2
    exit 1
fi

exit 0
