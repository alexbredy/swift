// This file is a part of the multi-file test driven by 'main.swift'.

// NB: No "-verify"--this file should parse successfully on its own.
// RUN: %swift %clang-importer-sdk -parse -parse-as-library %s

import AppKit

@NSApplicationMain // expected-error{{'NSApplicationMain' attribute cannot be used in a module that contains top-level code}}
class MyDelegate: NSObject, NSApplicationDelegate {
}

func hi() {}
