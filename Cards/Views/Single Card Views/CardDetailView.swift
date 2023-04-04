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
            Capsule()
                .foregroundColor(.yellow)
                .resizableView()
            Text("Resize Me!")
                .fontWeight(.bold)
                .font(.system(size: 500))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
                .resizableView()
            Circle()
                .resizableView()
                .offset(CGSize(width: 50, height: 200))
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
