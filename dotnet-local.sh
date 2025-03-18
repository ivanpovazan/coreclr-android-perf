#!/bin/bash

source "$(dirname "$0")/init.sh"

if [ ! -f "$LOCAL_DOTNET" ]; then
    echo "Error: $LOCAL_DOTNET does not exist. Please run ./prepare.sh first."
    exit 1
fi

${LOCAL_DOTNET} "$@"
