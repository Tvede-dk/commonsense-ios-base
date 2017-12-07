//
// Created by Kasper T on 20/11/2017.
// Copyright (c) 2017 commonsense. All rights reserved.
//

import Foundation

func isAnyNotNil(_ objects: Any?...) -> Bool {
    return objects.contains { object in
        return object != nil
    }
}
