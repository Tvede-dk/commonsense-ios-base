//
// Created by Kasper T on 09/11/2017.
// Copyright (c) 2017 commonsense. All rights reserved.
//

import Foundation

public extension CGFloat {

    /**
     *
     */
    public func isEqual(to: CGFloat, withStrife: Float) -> Bool {
        return abs(distance(to: to)) <=  CGFloat(abs(withStrife))
    }
}
