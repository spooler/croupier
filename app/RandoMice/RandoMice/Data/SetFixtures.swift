//
// Created by Paul Martens on 2018-02-18.
// Copyright (c) 2018 404. All rights reserved.
//

import Foundation

struct SetFixtures {
    static func getSpanishDeck() -> Set {
        return Set(
            name: "Baraja Española",
            description: "Maso de 50 cartas españolas",
            notes: "Incluye dos comodines",
            imageFile: "",
            items: SetItemFixtures.getSpanishCards()
        )
    }

    static func getFrenchDeck() -> Set {
        return Set(
            name: "Baraja Francesa",
            description: "Maso de 52 cartas francesas",
            notes: "Incluye dos comodines",
            imageFile: "",
            items: SetItemFixtures.getFrenchCards()
        )
    }

    static func getDice(numberOfFaces: Int = 6) -> Set {
        var name = "Dado"
        if numberOfFaces != 6 { name = "\(name) de \(numberOfFaces) caras" }

        return Set(
            name: name,
            imageFile: "",
            items: SetItemFixtures.getDiceFaces(numberOfFaces)
        )
    }
}
