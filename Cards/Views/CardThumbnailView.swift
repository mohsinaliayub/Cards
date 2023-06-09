//
//  CardThumbnailView.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct CardThumbnailView: View {
    @EnvironmentObject var viewState: ViewState
    let card: Card
    var size: CGSize = .zero
    
    var body: some View {
        Group {
            if let image = UIImage.load(uuidString: card.id.uuidString) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                card.backgroundColor
            }
        }
        .cornerRadius(10)
        .frame(width: Settings.thumbnailSize(size: size).width,
               height: Settings.thumbnailSize(size: size).height)
        .shadow(color: Color("shadow-color"), radius: 3, x: 0, y: 0)
        .onTapGesture {
            viewState.selectedCard = card
            withAnimation {
                viewState.showAllCards = false
            }
        }
    }
}

struct CardThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        CardThumbnailView(card: initialCards[0])
            .environmentObject(ViewState())
    }
}
