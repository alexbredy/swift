// RUN: %swift %clang-importer-sdk -emit-sil -I %S/Inputs/custom-modules -target x86_64-apple-macosx10.9 %s -verify

import Foundation

class MyArray : NSArray {
  func setBoolProperty(x: Bool) { } // expected-error{{method 'setBoolProperty' overrides Objective-C method 'setBoolProperty:' from superclass 'NSArray'}}

  @objc(objectAtIndexedSubscript:)
  func getObjectAt(i: Int) { } // expected-error{{method 'getObjectAt' overrides Objective-C method 'objectAtIndexedSubscript:' from superclass 'NSArray'}}
}

