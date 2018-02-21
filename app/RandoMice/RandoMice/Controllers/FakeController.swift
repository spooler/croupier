//
// Created by Paul Martens on 2018-02-17.
// Copyright (c) 2018 404. All rights reserved.
//

import UIKit

class FakeController: BaseController {
    override func viewDidLoad() {
        let targets: [String] = ["Foo", "Bar", "Baz", "Foobar"]

        let trucoStrategy = Strategy(exhaustible: true, itemsPerTarget: 3)
        let pokerStrategy = Strategy(exhaustible: true, itemsPerTarget: 5)
        let diceStrategy = Strategy(exhaustible: false, itemsPerTarget: 2)

        let spanishDeck40 = self.appDelegate.masterSets[.spanishDeck]!.makeSubSet(
            name: "Baraja Española x40",
            description: "Maso de 40 cartas españolas",
            notes: "Sin ochos ni nueves ni comodines",
            without: [
                "8 de oro", "8 de copa", "8 de espada", "8 de basto",
                "9 de oro", "9 de copa", "9 de espada", "9 de basto",
                "Comodín"
            ]
        )
        let frenchDeck52 = self.appDelegate.masterSets[.frenchDeck]!.makeSubSet(
            name: "Baraja Francesa x52",
            description: "Maso de 52 cartas francesas",
            notes: "Sin comodines",
            without: ["Comodín"]
        )
        let dice = self.appDelegate.masterSets[.dice]!

        print("----------\nTruco:")
        for (target, cards) in trucoStrategy.deal(from: spanishDeck40, for: targets) {
            print("  \(target):")
            for card in cards {
                print("    \(card.name)")
            }
        }

        print("----------\nPoker:")
        for (target, cards) in pokerStrategy.deal(from: frenchDeck52, for: targets) {
            print("  \(target):")
            for card in cards {
                print("    \(card.name)")
            }
        }

        print("----------\nDados:")
        for (target, results) in diceStrategy.roll(dice, for: targets) {
            print("  \(target):")
            for result in results {
                print("    \(result.name)")
            }
        }

        super.viewDidLoad()
    }
}
