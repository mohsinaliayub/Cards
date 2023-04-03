//
//  CardsListView.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var viewState: ViewState
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0..<10) { _ in
                    CardThumbnailView()
                }
            }
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
            .environmentObject(ViewState())
    }
}
