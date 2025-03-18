#!/bin/bash

source "$(dirname "$0")/init.sh"

if [ -z "$1" ]; then
    echo "Usage: $0 <dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent>"
    exit 1
fi

if [[ "$1" != "dotnet-new-android" && "$1" != "dotnet-new-maui" && "$1" != "dotnet-new-maui-samplecontent" ]]; then
    echo "Invalid parameter. Allowed values are: dotnet-new-android, dotnet-new-maui, dotnet-new-maui-samplecontent"
    exit 1
fi

SAMPLE_APP=$1

rm -rf "$SAMPLE_APP/bin"
rm -rf "$SAMPLE_APP/obj"

logfile="$SAMPLE_APP/msbuild_$timestamp.binlog"
${LOCAL_DOTNET} build -c Release -f net10.0-android -r android-arm64 -bl:$logfile "$SAMPLE_APP/$SAMPLE_APP.csproj"
