//
//  CardsView.swift
//  Cards
//
//  This is the initial view. It controls which full screen views
//  currently show. It will either display CardsListView or SingleCardView.
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct CardsView: View {
    @EnvironmentObject var viewState: ViewState
    
    var body: some View {
        ZStack {
            CardsListView()
            // If we're not displaying all cards, show SingleCardView.
            // We're only putting SingleCardView in front of CardsListView,
            // to keep the same scrolling position when user moves back to list view.
            if !viewState.showAllCards {
                SingleCardView()
            }
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
            .environmentObject(ViewState())
    }
}
