//
// Created by Kasper Tvede
// Copyright (c) commonsense. All rights reserved.
//

import Foundation
import XCTest
@testable import csenseIosBase

class DataTests: XCTestCase {
    func testHexStringPerformance() {
        guard let data = "some simple data that should be easy to convert".toData() else {
            failTest("could not convert string.")
            return
        }
        self.measure {
            for _ in 1..<5000 {
                data.toHexString().length.assertGreaterThan(other: 0)
            }
        }
    }

}