#!/bin/sh

THEME=stackoverflow

command_exists()
{
    command -v $1 >/dev/null 2>&1
}

if ! command_exists resume; then
    echo "Error: 'resume' command not found" >&2
    echo "Please install it from the instructions at this address https://jsonresume.org/getting-started/" >&2
    exit 1
fi

if resume export resume.html --theme "$THEME"; then
    if ! mv -v resume.html index.html; then
        echo "Error: Rendered web page not found" >&2
        exit 1
    fi
else
    echo "Error: Web page rendering failure" >&2
    exit 1
fi

exit 0
