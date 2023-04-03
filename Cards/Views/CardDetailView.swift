//
//  CardDetailView.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var viewState: ViewState
    @State private var currentModal: CardModal?
    
    var body: some View {
        Color.yellow
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { viewState.showAllCards.toggle() }) {
                        Text("Done")
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    CardBottomToolbar(cardModal: $currentModal)
                }
            }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView()
            .environmentObject(ViewState())
    }
}
