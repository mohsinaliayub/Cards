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
    @EnvironmentObject var store: CardStore
    
    var body: some View {
        ZStack {
            CardsListView()
            VStack {
                Spacer()
                createButton
            }
            // If we're not displaying all cards, show SingleCardView.
            // We're only putting SingleCardView in front of CardsListView,
            // to keep the same scrolling position when user moves back to list view.
            if !viewState.showAllCards {
                SingleCardView()
                    .zIndex(1)
                    .transition(.move(edge: .bottom))
            }
        }
        .background {
            Color("background")
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    var createButton: some View {
        Button(action: {
            viewState.selectedCard = store.addCard()
            withAnimation {
                viewState.showAllCards = false
            }
        }) {
            Label("Create New", systemImage: "plus")
                .frame(maxWidth: .infinity)
        }
        .font(.system(size: 16, weight: .bold))
        .padding([.top, .bottom], 10)
        .background(Color("barColor"))
        .padding(.bottom)
        .tint(.white)
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
            .environmentObject(ViewState())
            .environmentObject(CardStore(defaultData: true))
        
        CardsView()
            .environmentObject(ViewState())
            .environmentObject(CardStore(defaultData: true))
            .preferredColorScheme(.dark)
    }
}
