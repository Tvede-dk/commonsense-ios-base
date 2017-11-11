//
// Created by Kasper T on 09/11/2017.
// Copyright (c) 2017 commonsense. All rights reserved.
//

import Foundation
import csenseTests
@testable import csenseIosBase
import XCTest
class CGFloatTests : XCTestCase {


    func testIsEqual(){
        let valueAlmostInRange: CGFloat = 2
        valueAlmostInRange.isEqual(to: 1.8, withStrife: 1).assert(true)

        let valueOutOfRange : CGFloat = 2
        valueOutOfRange.isEqual(to: 1.8, withStrife: 0.1).assert(false)

        let valueInRange: CGFloat = 2
        valueInRange.isEqual(to: 2, withStrife: 0.01).assert(true)

        let negAlmostInRange : CGFloat = -2
        negAlmostInRange.isEqual(to: -1.8, withStrife: 1).assert(true)

        negAlmostInRange.isEqual(to: -1.8, withStrife: -1).assert(true, message: "should ignore sign of withStrafe parameter")

        let negOutOfRange : CGFloat = -2
        negOutOfRange.isEqual(to: -1, withStrife: 0.5).assert(false)


    }


}