//
//  CardThumbnailView.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct CardThumbnailView: View {
    @EnvironmentObject var viewState: ViewState
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(.gray)
            .frame(width: 150, height: 250)
            .onTapGesture {
                viewState.showAllCards.toggle()
            }
    }
}

struct CardThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        CardThumbnailView()
            .environmentObject(ViewState())
    }
}