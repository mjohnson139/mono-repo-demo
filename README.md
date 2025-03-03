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

## CircleCI

This repository uses CircleCI for continuous integration. The configuration files for CircleCI can be found in the `.circleci/` directory.

## License

This project is licensed under the MIT License - see the LICENSE file for details.