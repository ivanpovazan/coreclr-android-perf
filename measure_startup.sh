#!/bin/bash

source "$(dirname "$0")/init.sh"

if [ ! -f "$LOCAL_XAPTR" ]; then
    echo "Error: $LOCAL_XAPTR does not exist. Please run ./prepare.sh first."
    exit 1
fi

if [[ -z "$1" ]]; then
    echo "Usage: $0 <dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent>"
    exit 1
fi

XAPTR_CONF="$1".conf

echo "${LOCAL_XAPTR} -x $XAPTR_CONF"
${LOCAL_XAPTR} -x $XAPTR_CONF