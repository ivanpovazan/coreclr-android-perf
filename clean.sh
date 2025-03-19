#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <all|dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent>"
    exit 1
fi

SAMPLE_APP=$1

if [[ "$SAMPLE_APP" == "all" ]]; then
    APPS=("dotnet-new-android" "dotnet-new-maui" "dotnet-new-maui-samplecontent")
else
    APPS=("$SAMPLE_APP")
fi

for app in "${APPS[@]}"; do
    echo "Cleaning $app ..."
    rm -rf "$app/bin"
    rm -rf "$app/obj"
    rm -f "$app"/*.binlog
done
