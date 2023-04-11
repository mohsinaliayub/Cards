//
//  ViewState.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import Foundation

class ViewState: ObservableObject {
    @Published var showAllCards = true {
        didSet {
            // when we're showing all cards, there's no card selection
            // so, we set it to nil.
            if showAllCards { selectedCard = nil }
        }
    }
    
    @Published var selectedElement: CardElement?
    
    var selectedCard: Card? {
        didSet {
            if selectedCard == nil {
                selectedElement = nil
            }
        }
    }
    
    convenience init(card: Card) {
        self.init()
        showAllCards = false
        selectedCard = card
        selectedElement = nil
    }
}
