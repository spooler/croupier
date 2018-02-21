//
// Created by Paul Martens on 2018-02-17.
// Copyright (c) 2018 404. All rights reserved.
//

import Foundation

//TODO: make a queue of strategies with a next() method
class Strategy {
    let exhaustible: Bool
    let itemsPerTarget: Int

    init(exhaustible: Bool, itemsPerTarget: Int) {
        self.exhaustible = exhaustible
        self.itemsPerTarget = itemsPerTarget
    }

    func deal(from set: Set, for targets: [String]) -> [String: [SetItem]] {
        return self.select(from: set, for: targets)
    }

    func roll(_ set: Set, for targets: [String]) -> [String: [SetItem]] {
        return self.select(from: set, for: targets)
    }

    private func select(from set: Set, for targets: [String]) -> [String: [SetItem]] {
        var result: [String: [SetItem]] = [:]

        for target in targets {
            result[target] = self.pick(from: set)
        }

        return result
    }

    private func pick(from set: Set) -> [SetItem] {
        var items: [SetItem] = []
        for _ in 0..<self.itemsPerTarget {
            let item = self.pickOne(from: set)
            items.append(item)
        }

        return items
    }

    private func pickOne(from set: Set) -> SetItem {
        var items = set.getItems()
        let index = Int(arc4random() % UInt32(items.count))
        let item = items.remove(at: index)

        if self.exhaustible { set.updateItems(items) }

        return item
    }
}
