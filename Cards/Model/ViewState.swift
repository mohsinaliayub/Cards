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
    var selectedCard: Card?
}
