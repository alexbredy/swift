// RUN: %swift %clang-importer-sdk -parse -verify -target x86_64-apple-macosx10.9 %s

import blocks
import Foundation

var someNSString : NSString
func useString(s: String) {}

dispatch_async(dispatch_get_current_queue()) { }
someNSString.enumerateLinesUsingBlock {(s:String?) in }
someNSString.enumerateLinesUsingBlock {s in }
someNSString.enumerateLinesUsingBlock({ useString($0) })

dispatch_async(dispatch_get_current_queue(), /*not a block=*/()) // expected-error{{'()' is not convertible to 'dispatch_block_t'}}

