// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// This is the shared library for our mono repo - used by both App1 and App2
public enum MonoCore {
    public static func getSharedMessage() -> String {
        return "Hello from MonoCore!"
    }
}
