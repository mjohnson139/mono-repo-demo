#!/bin/bash

# Store the root directory
ROOT_DIR=$(pwd)

# Check for changes in each directory
check_directory_changes() {
    local directory=$1
    if [ -n "$(git diff HEAD~1 --name-only $directory)" ]; then
        eval "HAS_CHANGES_$directory=true"
    else
        eval "HAS_CHANGES_$directory=false"
    fi
}

# Generate Xcode project for an app
generate_project() {
    local app_dir=$1
    echo "Generating Xcode project for $app_dir..."
    cd "$ROOT_DIR/$app_dir" && xcodegen generate
}

echo "Checking for changes..."
check_directory_changes "App1"
check_directory_changes "App2"
check_directory_changes "MonoCore"

# Build MonoCore if changed
if [ "$HAS_CHANGES_MonoCore" = true ]; then
    echo "Building MonoCore..."
    cd "$ROOT_DIR/MonoCore" && swift build
    cd "$ROOT_DIR"
else
    echo "No changes in MonoCore, skipping build"
fi

# Build App1 if it or MonoCore changed
if [ "$HAS_CHANGES_App1" = true ] || [ "$HAS_CHANGES_MonoCore" = true ]; then
    echo "Building App1..."
    generate_project "App1"
    cd "$ROOT_DIR/App1" && ./build.sh
    cd "$ROOT_DIR"
else
    echo "No changes affecting App1, skipping build"
fi

# Build App2 if it or MonoCore changed
if [ "$HAS_CHANGES_App2" = true ] || [ "$HAS_CHANGES_MonoCore" = true ]; then
    echo "Building App2..."
    generate_project "App2"
    cd "$ROOT_DIR/App2" && ./build.sh
    cd "$ROOT_DIR"
else
    echo "No changes affecting App2, skipping build"
fi