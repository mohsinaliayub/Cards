//
//  CardStore.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 04.04.23.
//

import Foundation

class CardStore: ObservableObject {
    @Published var cards = [Card]()
    
    init(defaultData: Bool = false) {
        if defaultData {
            cards = initialCards
        }
    }
}
