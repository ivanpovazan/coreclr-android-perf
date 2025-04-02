#!/bin/bash

# Define variables
SCRIPT_DIR=$(dirname "$0")
BUILD_DIR="$SCRIPT_DIR/build"
TOOLS_DIR="$SCRIPT_DIR/tools"
DOTNET_INSTALL_SCRIPT="$TOOLS_DIR/dotnet-install.sh"
DOTNET_DIR="$SCRIPT_DIR/.dotnet"
LOCAL_DOTNET="$DOTNET_DIR/dotnet"
LOCAL_PACKAGES="$SCRIPT_DIR/packages"
LOCAL_XAPTR="$BUILD_DIR/xaptr"
VERSIONS_LOG="$SCRIPT_DIR/versions.log"
NUGET_CONFIG="$SCRIPT_DIR/NuGet.config"
