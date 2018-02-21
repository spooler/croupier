//
// Created by Paul Martens on 2018-02-17.
// Copyright (c) 2018 404. All rights reserved.
//

import Foundation

class SetItem {
    let name: String
    let imageFile: String?

    init(name: String, imageFile: String? = nil) {
        self.name = name
        self.imageFile = imageFile
    }
}

extension SetItem: Equatable {
    static func ==(lhs: SetItem, rhs: SetItem) -> Bool {
        return lhs.name == rhs.name
    }
}
