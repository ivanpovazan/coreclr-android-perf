#!/bin/bash

source "$(dirname "$0")/init.sh"

if [ ! -f "$LOCAL_DOTNET" ]; then
    echo "Error: $LOCAL_DOTNET does not exist. Please run ./prepare.sh first."
    exit 1
fi

if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: $0 <dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent> <mono-coreclr> [run]"
    exit 1
fi

if [[ "$1" != "dotnet-new-android" && "$1" != "dotnet-new-maui" && "$1" != "dotnet-new-maui-samplecontent" ]]; then
    echo "Invalid parameter. Allowed values are: dotnet-new-android, dotnet-new-maui, dotnet-new-maui-samplecontent"
    exit 1
fi

if [[ "$2" != "mono" && "$2" != "coreclr" ]]; then
    echo "Invalid parameter. Allowed values are: mono, coreclr"
    exit 1
fi

if [[ -n "$3" && "$3" != "run" ]]; then
    echo "Invalid third parameter. Allowed value is: run"
    exit 1
else
    RUN_TARGET="-t:Run"
fi

SAMPLE_APP=$1
RUNTIME=$2

rm -rf "$SAMPLE_APP/bin"
rm -rf "$SAMPLE_APP/obj"
logfile="$SAMPLE_APP/msbuild_$timestamp.binlog"

if [[ "$RUNTIME" == "mono" ]]; then
    RUNTIME_SPECIFIC_ARGS="-p:UseMonoRuntime=true"
elif [[ "$RUNTIME" == "coreclr" ]]; then
    RUNTIME_SPECIFIC_ARGS="-p:UseMonoRuntime=false"
fi

if [[ -n "$4" ]]; then
    RUNTIME_SPECIFIC_ARGS="$RUNTIME_SPECIFIC_ARGS $4"
fi

echo "Building $SAMPLE_APP with $RUNTIME runtime via: ${LOCAL_DOTNET} build -c Release -f net10.0-android -r android-arm64 -bl:$logfile "$SAMPLE_APP/$SAMPLE_APP.csproj" $RUNTIME_SPECIFIC_ARGS $RUN_TARGET"
${LOCAL_DOTNET} build -c Release -f net10.0-android -r android-arm64 -bl:$logfile "$SAMPLE_APP/$SAMPLE_APP.csproj" $RUNTIME_SPECIFIC_ARGS $RUN_TARGET
