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
    @Binding var card: Card
    
    var content: some View {
        ZStack {
            card.backgroundColor
                .edgesIgnoringSafeArea(.all)
            ForEach(card.elements, id: \.id) { element in
                CardElementView(element: element)
                    .resizableView()
                    .frame(width: element.transform.size.width,
                           height: element.transform.size.height)
            }
        }
    }
    
    var body: some View {
        content
            .modifier(CardToolbar(currentModal: $currentModal))
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(card: .constant(initialCards[0]))
            .environmentObject(ViewState())
    }
}
