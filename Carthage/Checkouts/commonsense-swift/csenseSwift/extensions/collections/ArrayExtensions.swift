//
//  ArrayExtensions.swift
//  csenseSwift
//
//  Created by Kasper T on 04/11/2017.
//  Copyright © 2017 commonsense. All rights reserved.
//

import Foundation

public extension Array {
    /**
     * Tells if there is a key with the given index
     */
    public func isIndexValid(_ index: Int) -> Bool {
        return index >= 0 && index < self.count
    }

    /**
     *
     */
    public mutating func insertOrUpdate(index: Int, value: Element) -> Element? {
        let isValidIndex = self.isIndexValid(index)
        let result = getSafe(index: index)
        if isValidIndex {
            self[index] = value
        } else {
            self.insert(value, at: index)
        }
        return result
    }

    /**
     * Retrives an element at a given index,if the index is valid. nil otherwise.
     */
    public func getSafe(index: Int) -> Element? {
        if isIndexValid(index) {
            return self[index]
        } else {
            return nil
        }
    }

    /**
     * Repeats this collection to the designated size, will loop over all content and copy that in order
     * if the to size is less than, or this collection is empty, then an empty result will be returned
     */
    public func repeate(toSize: Int) -> [Element] {
        guard let first = first, toSize > count else {
            return []
        }
        let intCount = Int(count)
        return toSize.mapTimes(generator: { (counter) -> Element in
            let safeIndex = counter % intCount
            return self.getSafe(index: safeIndex) ?? first
        })
    }
}

public extension Optional where Wrapped: Collection {
    /**
     * the count or zero if this optional is nil.
     */
    public var countOrZero: Wrapped.IndexDistance {
        return self?.count ?? 0
    }
}

/**
 * Appends the righthand side to the left hand side.
 */
public func += <T>(left: inout [T], right: T) {
    left.append(right)
}
