//
//  ListSelectionView.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 14.04.23.
//

import SwiftUI

struct ListSelectionView: View {
    @Binding var selection: CardListState
    
    var body: some View {
        Picker("", selection: $selection) {
            Image(systemName: "square.grid.2x2.fill")
                .tag(CardListState.list)
            Image(systemName: "rectangle.stack.fill")
                .tag(CardListState.carousel)
        }
        .pickerStyle(.segmented)
        .frame(width: 200)
    }
}

struct ListSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ListSelectionView(selection: .constant(.list))
    }
}
