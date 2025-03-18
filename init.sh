#!/bin/bash

# Define variables
SCRIPT_DIR=$(dirname "$0")
TOOLS_DIR="$SCRIPT_DIR/tools"
DOTNET_INSTALL_SCRIPT="$TOOLS_DIR/dotnet-install.sh"
DOTNET_DIR="$SCRIPT_DIR/.dotnet"
LOCAL_DOTNET="$DOTNET_DIR/dotnet"
LOCAL_PACKAGES="$SCRIPT_DIR/packages"
VERSIONS_LOG="$SCRIPT_DIR/versions.log"
timestamp=$(date +"%Y%m%d%H%M%S")
