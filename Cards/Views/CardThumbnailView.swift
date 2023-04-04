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
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(card.backgroundColor)
            .frame(width: Settings.thumbnailSize.width,
                   height: Settings.thumbnailSize.height)
            .onTapGesture {
                viewState.showAllCards.toggle()
            }
    }
}

struct CardThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        CardThumbnailView(card: initialCards[0])
            .environmentObject(ViewState())
    }
}
