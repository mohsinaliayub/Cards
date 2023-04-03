//
//  SingleCardView.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct SingleCardView: View {
    @EnvironmentObject var viewState: ViewState
    
    var body: some View {
        // Used NavigationStack instead of NavigationView to only have one single
        // root view.
        NavigationStack {
            CardDetailView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView()
            .environmentObject(ViewState())
    }
}


