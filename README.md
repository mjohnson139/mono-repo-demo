# Mono Repo Demo

This repository is a monorepo containing multiple applications and a core library. It uses CircleCI for continuous integration and requires the latest version of Xcode for building the projects.

## Structure

- **App1/**: Contains the source code and project files for the first application.
- **App2/**: Contains the source code and project files for the second application.
- **MonoCore/**: Contains the core library shared between the applications.

## Building Locally

To build the projects locally, follow these steps:

1. **Install XcodeGen**: `brew install xcodegen`
2. **Set up GitHub post-commit hooks**: Ensure you have the necessary post-commit hooks set up in your GitHub repository.
   - Make the hook executable: `chmod +x .git/hooks/post-commit`
3. **Install CircleCI**: Follow the instructions on the CircleCI website to install CircleCI on your machine.
4. **Install Xcode**: Make sure you have the latest version of Xcode installed, along with the Xcode build tools.
5. **Install xcpretty**: `gem install xcpretty`

## Post-Commit Hook Example

Here is an example of a post-commit hook script (`.git/hooks/post-commit`) that we use locally:

```
#!/bin/bash

# Allow skipping the build check with an environment variable
if [ "$SKIP_BUILD_CHECK" = "1" ]; then
  echo "⚠️  Skipping build check (SKIP_BUILD_CHECK=1)"
  exit 0
fi

echo "Running post-commit build to verify changes..."

# Run the local build script
./local-build.sh
BUILD_RESULT=$?

# Report build status but don't affect the commit (which is already done)
if [ $BUILD_RESULT -ne 0 ]; then
  echo "❌ Build failed! Your commit was saved, but there may be issues to fix."
else
  echo "✅ Build succeeded. All changes verify successfully."
fi

exit 0  # Always exit with success since we don't want to interfere with the commit```

## CircleCI

This repository uses CircleCI for continuous integration. The configuration files for CircleCI can be found in the `.circleci/` directory.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
