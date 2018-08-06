//
// Created by Kasper Tvede
// Copyright (c) commonsense. All rights reserved.
//

import Foundation
import csenseSwift

public extension Data {

    //converts the given data in a hex representation in a string.

    public func toHexString() -> String {
        let hexStringUtf16Array = Array("0123456789ABCDEF".utf16)
        var chars: [unichar] = []
        chars.reserveCapacity(2 * count)
        for byte in self {
            chars.append(hexStringUtf16Array[Int(byte.upperPart)])
            chars.append(hexStringUtf16Array[Int(byte.lowerPart)])
        }
        return String(utf16CodeUnits: chars, count: chars.count)
    }
}