//
// Created by Paul Martens on 2018-02-18.
// Copyright (c) 2018 404. All rights reserved.
//

import Foundation

struct SetItemFixtures {
    static func getSpanishCards() -> [SetItem] {
        var cards: [SetItem] = []
        for idx in 2...9 {
            cards.append(SetItem(name: "\(idx) de oro"))
            cards.append(SetItem(name: "\(idx) de copa"))
            cards.append(SetItem(name: "\(idx) de espada"))
            cards.append(SetItem(name: "\(idx) de basto"))
        }
        for cardName in ["Ancho", "Sota", "Caballo", "Rey"] {
            cards.append(SetItem(name: "\(cardName) de oro"))
            cards.append(SetItem(name: "\(cardName) de copa"))
            cards.append(SetItem(name: "\(cardName) de espada"))
            cards.append(SetItem(name: "\(cardName) de basto"))
        }
        cards.append(SetItem(name: "Comodín"))
        cards.append(SetItem(name: "Comodín"))

        return cards
    }

    static func getFrenchCards() -> [SetItem] {
        var cards: [SetItem] = []

        for idx in 2...10 {
            cards.append(SetItem(name: "\(idx)♦"))
            cards.append(SetItem(name: "\(idx)♣"))
            cards.append(SetItem(name: "\(idx)♥"))
            cards.append(SetItem(name: "\(idx)♠"))
        }
        for cardLetter in ["A", "J", "Q", "K"] {
            cards.append(SetItem(name: "\(cardLetter)♦"))
            cards.append(SetItem(name: "\(cardLetter)♣"))
            cards.append(SetItem(name: "\(cardLetter)♥"))
            cards.append(SetItem(name: "\(cardLetter)♠"))
        }
        cards.append(SetItem(name: "\u{1f0df}"))
        cards.append(SetItem(name: "\u{1f0df}"))

        return cards
    }

    static func getDiceFaces(_ numberOfFaces: Int = 6) -> [SetItem] {
        var faces: [SetItem] = []
        for face in 1...numberOfFaces {
            faces.append(SetItem(name: "\(face)"))
        }

        return faces
    }
}
