//
//  ViewState.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import Foundation

enum CardListState {
    case list, carousel
}

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
    
    // Determines which view to show in `CardsListView`
    @Published var cardListState: CardListState = .list
    
    // For sharing the card with a screenshot - see `RenderableView`
    var shouldScreenshot = false
    
    convenience init(card: Card) {
        self.init()
        showAllCards = false
        selectedCard = card
        selectedElement = nil
    }
}
