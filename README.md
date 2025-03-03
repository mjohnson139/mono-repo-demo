# Mono Repo Demo

This repository is a monorepo containing multiple applications and a core library. It uses CircleCI for continuous integration and requires the latest version of Xcode for building the projects.

## Structure

- **App1/**: Contains the source code and project files for the first application.
- **App2/**: Contains the source code and project files for the second application.
- **MonoCore/**: Contains the core library shared between the applications.

## Building Locally

To build the projects locally, follow these steps:

1. **Set up GitHub post-commit hooks**: Ensure you have the necessary post-commit hooks set up in your GitHub repository.
2. **Install CircleCI**: Follow the instructions on the CircleCI website to install CircleCI on your machine.
3. **Install Xcode**: Make sure you have the latest version of Xcode installed, along with the Xcode build tools.

## Post-Commit Hook Example

Here is an example of a post-commit hook script (`local-build.sh`) that we use locally:

```bash
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

# Check if xcpretty is installed
check_xcpretty() {
    if ! command -v xcpretty &> /dev/null; then
        echo "xcpretty is not installed. Installing xcpretty..."
        gem install xcpretty
    fi
}

# Check for changes
check_directory_changes "App1"
check_directory_changes "App2"
check_directory_changes "MonoCore"

# Make sure xcpretty is available
check_xcpretty

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
    cd "$ROOT_DIR/App1" && ./build.sh | xcpretty
    cd "$ROOT_DIR"
else
    echo "No changes affecting App1, skipping build"
fi

# Build App2 if it or MonoCore changed
if [ "$HAS_CHANGES_App2" = true ] || [ "$HAS_CHANGES_MonoCore" = true ]; then
    echo "Building App2..."
    generate_project "App2"
    cd "$ROOT_DIR/App2" && ./build.sh | xcpretty
    cd "$ROOT_DIR"
else
    echo "No changes affecting App2, skipping build"
fi
```

## CircleCI

This repository uses CircleCI for continuous integration. The configuration files for CircleCI can be found in the `.circleci/` directory.

## License

This project is licensed under the MIT License - see the LICENSE file for details.