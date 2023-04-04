//
//  SingleCardView.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct SingleCardView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var store: CardStore
    
    var body: some View {
        // Finding the index of card, then pass it as a binding. Because we want
        // the card to be mutable to work on it in CardDetailView.
        if let selectedCard = viewState.selectedCard,
           let index = store.index(for: selectedCard) {
            // Used NavigationStack instead of NavigationView to only have one single
            // root view.
            NavigationStack {
                CardDetailView(card: $store.cards[index])
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView()
            .environmentObject(ViewState(card: initialCards[0]))
            .environmentObject(CardStore(defaultData: true))
    }
}


