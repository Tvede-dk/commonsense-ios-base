//
// Created by Kasper T on 09/11/2017.
// Copyright (c) 2017 commonsense. All rights reserved.
//

import Foundation
import csenseSwift

/**
 *  A "log" statement (contains location and a message).
 */
public struct LogStatement {
    let message: String?
    let file: String
    let line: Int
    let functionName: String
}

public class Logger {

    /**
     * only meant for internal inheritance based changes.
     */
    init() {

    }

    /**
     * The shared instance
     */
    public static let shared = Logger()
    /**
     * Controls whenever we may call the output logger at all.
     */
    public var mayLog: Bool = true
    /**
     * The logging function, just pointing to print, but in case of required overloading,
       set this to your own function to allow it to be customized.
     */
    public var outputLogger: Function<LogStatement> = print

    /**
     * Logs a fatal message
     */
    public func logFatal(message: String?,
                         file: String = #file,
                         line: Int = #line,
                         functionName: String = #function) {
        doLog(LogStatement(message: message, file: file, line: line, functionName: functionName))
    }

    /**
     * Logs a warning message
     */
    public func logWarning(message: String?,
                           file: String = #file,
                           line: Int = #line,
                           functionName: String = #function) {
        doLog(LogStatement(message: message, file: file, line: line, functionName: functionName))
    }

    /**
     * Logs a debug message
     */
    public func logDebug(message: String?,
                         file: String = #file,
                         line: Int = #line,
                         functionName: String = #function) {
        doLog(LogStatement(message: message, file: file, line: line, functionName: functionName))
    }

    /**
     * make sure that we only log iff we are allowed to.
     */
    private func doLog(_ message: LogStatement) {
        if mayLog {
            outputLogger(message)
        }
    }

}

/**
 * Prints a logStatement to std-out
 */
public func print(_ line: LogStatement) {
    print(line.createLogString())
}

public extension LogStatement {
    /**
     * Converts a LogStatement to a "log line" of text
     * open able / understood by eg AppCode ect.
     */
    func createLogString() -> String {
        return "\(file):\(line) \(functionName)) -  \(message ?? "")"
    }
}

// MARK: shared logging (trait the functionality).
public protocol SharedLogging {
}

public extension SharedLogging {

    public func logFatal(message: String,
                         file: String = #file,
                         line: Int = #line,
                         functionName: String = #function) {
        Logger.shared.logFatal(message: message, file: file, line: line, functionName: functionName)
    }

    public func logWarning(message: String,
                           file: String = #file,
                           line: Int = #line,
                           functionName: String = #function) {
        Logger.shared.logWarning(message: message)
    }

    public func logDebug(message: String,
                         file: String = #file,
                         line: Int = #line,
                         functionName: String = #function) {
        Logger.shared.logDebug(message: message, file: file, line: line, functionName: functionName)
    }

    /**
     * Logs a fatal message, only if the given condition is met
     */

    public func logFatalIf(condition: Bool,
                           message: String,
                           file: String = #file,
                           line: Int = #line,
                           functionName: String = #function) {
        if condition {
            logFatal(message: message, file: file, line: line, functionName: functionName)
        }
    }

    /**
     * Logs a fatal message, only if the given condition is met
     */

    public func logWarningIf(condition: Bool,
                             message: String,
                             file: String = #file,
                             line: Int = #line,
                             functionName: String = #function) {
        if condition {
            logWarning(message: message, file: file, line: line, functionName: functionName)
        }
    }

    /**
     * Logs a fatal message, only if the given condition is met
     */

    public func logDebugIf(condition: Bool,
                           message: String,
                           file: String = #file,
                           line: Int = #line,
                           functionName: String = #function) {
        if condition {
            logDebug(message: message, file: file, line: line, functionName: functionName)
        }
    }
}

extension UIViewController: SharedLogging {
}

extension UIView: SharedLogging {
}
