//
//  BinarySearch.swift
//  csenseSwift
//
//  Created by Kasper T on 10/11/2017.
//  Copyright © 2017 commonsense. All rights reserved.
//

import Foundation

public extension Array where Element: Comparable {
    public func binarySearchClosest(key: Element) -> Int? {
        return binarySearch(key: key, extractor: { $0 })
    }
}

public extension Array {

    public func binarySearch<T: Comparable>(key: T, extractor: FunctionResult<Element, T>) -> Int? {
        let temp = binarySearch(key: key, extractor: extractor, defaultValueFunction: { _ in -1 })
        return temp.isNegative.map(ifTrue: nil, ifFalse: temp)
    }

    public func binarySearchClosest<T: Comparable>(key: T, extractor: FunctionResult<Element, T>) -> Int {
        return binarySearch(key: key, extractor: extractor, defaultValueFunction: { value in value })
    }

    /**
     *
     *
     * defaultValueFunction : given the middle (from the end of the iteration), calculates the result.
     */
    private func binarySearch<T: Comparable>(key: T,
                                             extractor: FunctionResult<Element, T>,
                                             defaultValueFunction: FunctionResult<Int, Int>) -> Int {
        var lowerBound = 0
        var upperBound = count
        while lowerBound < upperBound {
            let midIndex = lowerBound.middle(upperBound: upperBound)
            let toLookAt = extractor(self[midIndex])
            if toLookAt == key {
                return midIndex
            } else if toLookAt < key {
                lowerBound = midIndex + 1
            } else {
                upperBound = midIndex
            }
        }
        let middle = lowerBound.middle(upperBound: upperBound)
        return defaultValueFunction(middle)
    }
}
