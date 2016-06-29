#!/bin/sh

command_exists()
{
    command -v $1 >/dev/null 2>&1
}

if ! command_exists resume; then
    echo "Error: 'resume' command not found" >&2
    echo "Please install it from the instructions at this address https://jsonresume.org/getting-started/" >&2
    exit 1
fi

resume export resume.html --theme stackoverflow

if [ $? == 0 ]; then
    mv resume.html index.html
    echo "resume.html -> index.html"
else
    echo "Error: Web page rendering failure" >&2
fi

exit $?
