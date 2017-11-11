//
// Created by Kasper T on 10/11/2017.
// Copyright (c) 2017 commonsense. All rights reserved.
//

import Foundation
import csenseSwift
import XCTest
import csenseTests
@testable import csenseIosBase

class LoggerTests : XCTestCase {
    override func setUp() {
        super.setUp()
        Logger.shared.mayLog = true
        Logger.shared.outputLogger = { message in print(message)}
    }

    func testMayLog(){
        Logger.shared.mayLog = false
        Logger.shared.outputLogger = {message in
            self.failTests("Should not be called.")
        }
        Logger.shared.logFatal(message: "someMessage")
        Logger.shared.logWarning(message: "someMessage")
        Logger.shared.logDebug(message: "someMessage")


        Logger.shared.mayLog = true
        var didUpdate = false
        Logger.shared.outputLogger = { message in
            message.contains("someLog").assert(true)
            didUpdate = true
        }
        Logger.shared.logFatal(message: "someLog")
        didUpdate.assert(true)
    }
}