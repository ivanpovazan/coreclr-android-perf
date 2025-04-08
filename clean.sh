#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <all|dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent>"
    exit 1
fi

SAMPLE_APP=$1

if [[ "$SAMPLE_APP" == "all" ]]; then
    APPS=("dotnet-new-android" "dotnet-new-maui" "dotnet-new-maui-samplecontent")
else
    if [[ "$SAMPLE_APP" == "dotnet-new-android" || "$SAMPLE_APP" == "dotnet-new-maui" || "$SAMPLE_APP" == "dotnet-new-maui-samplecontent" ]]; then
        APPS=("$SAMPLE_APP")
    else
        echo "Invalid option: $SAMPLE_APP"
        echo "Usage: $0 <all|dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent>"
        exit 1
    fi
fi

for app in "${APPS[@]}"; do
    echo "Cleaning $app ..."
    rm -rf "$app/bin"
    rm -rf "$app/obj"
    rm -rf "$app/perfdata"
    rm -f "$app"/*.binlog
    find . -type d -name "./build/$app*" -exec rm -rf {} +
done
