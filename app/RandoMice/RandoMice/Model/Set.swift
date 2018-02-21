//
// Created by Paul Martens on 2018-02-17.
// Copyright (c) 2018 404. All rights reserved.
//

import Foundation

class Set {
    let name: String
    let description: String?
    let notes: String?
    let imageFile: String
    private let originalItems: [SetItem]
    private var currentItems: [SetItem]

    init(
        name: String,
        description: String? = nil,
        notes: String? = nil,
        imageFile: String,
        items: [SetItem]
    ) {
        self.name = name
        self.description = description
        self.notes = notes
        self.imageFile = imageFile
        self.originalItems = items
        self.currentItems = items
    }

    func getItems() -> [SetItem] {
        return self.currentItems
    }

    func updateItems(_ items: [SetItem]) {
        self.currentItems = items
    }

    func reset() {
        self.currentItems = self.originalItems
    }

    func makeSubSet(
        name: String,
        description: String? = nil,
        notes: String? = nil,
        imageFile: String? = nil,
        without excludedItems: [String]
    ) -> Set {
        return Set(
            name: name,
            description: description ?? self.description,
            notes: notes ?? self.notes,
            imageFile: imageFile ?? self.imageFile,
            items: self.originalItems.filter { item in
                !excludedItems.contains { $0 == item.name }
            }
        )
    }
}

