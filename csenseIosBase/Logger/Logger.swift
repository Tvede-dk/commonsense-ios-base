//
// Created by Kasper T on 09/11/2017.
// Copyright (c) 2017 commonsense. All rights reserved.
//

import Foundation
import csenseSwift

public class Logger {


    private init() {

    }

    public static let shared = Logger()

    public var mayLog: Bool = true

    public var outputLogger: Function<String> = { (message: String) in
        print(message)
    }

    public func logFatal(message: String?, file: String = #file, line: Int = #line, functionName: String = #function) {
        doLog(createLogLine(message: message, file: file, line: line, functionName: functionName))
    }

    public func logWarning(message: String?, file: String = #file, line: Int = #line, functionName: String = #function) {
        doLog(createLogLine(message: message, file: file, line: line, functionName: functionName))
    }

    public func logDebug(message: String?, file: String = #file, line: Int = #line, functionName: String = #function) {
        doLog(createLogLine(message: message, file: file, line: line, functionName: functionName))
    }

    private func doLog(_ message: String) {
        if (mayLog) {
            outputLogger(message)
        }
    }

    private func createLogLine(message: String?, file: String = #file, line: Int = #line, functionName: String = #function) -> String {
        return "\(file):\(line)\(functionName)) -  \(message ?? "")"
    }
}

public extension UIViewController {

    public func logFatal(message: String, file: String = #file, line: Int = #line, functionName: String = #function) {
        Logger.shared.logFatal(message: message, file: file, line: line, functionName: functionName)
    }

    public func logWarning(message: String, file: String = #file, line: Int = #line, functionName: String = #function) {
        Logger.shared.logWarning(message: message)
    }

    public func logDebug(message: String, file: String = #file, line: Int = #line, functionName: String = #function) {
        Logger.shared.logDebug(message: message, file: file, line: line, functionName: functionName)
    }
}