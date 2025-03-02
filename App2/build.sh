#!/bin/bash

# Build for iOS Simulator
xcodebuild clean build \
  -project App2.xcodeproj \
  -scheme App2 \
  -destination "platform=iOS Simulator,name=iPhone 15,OS=17.4" \
  -configuration Debug