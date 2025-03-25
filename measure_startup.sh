#!/bin/bash

source "$(dirname "$0")/init.sh"

if [ ! -f "$LOCAL_XAPTR" ]; then
    echo "Error: $LOCAL_XAPTR does not exist. Please run ./prepare.sh first."
    exit 1
fi

${LOCAL_XAPTR} "$@"