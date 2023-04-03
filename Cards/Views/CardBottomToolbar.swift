//
//  CardBottomToolbar.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct ToolbarButtonView: View {
    typealias CardData = (text: String, systemImageName: String)
    
    let modal: CardModal
    private let modalButton: [CardModal: CardData] = [
        .photoPicker: ("Photos", "photo"),
        .framePicker: ("Frames", "square.on.circle"),
        .stickerPicker: ("Stickers", "heart.circle"),
        .textPicker: ("Text", "textformat")
    ]
    
    var body: some View {
        if let text = modalButton[modal]?.text,
           let imageName = modalButton[modal]?.systemImageName {
            VStack {
                Image(systemName: imageName)
                    .font(.title2)
                Text(text)
            }
            .padding(.top)
        }
    }
}

struct CardBottomToolbar: View {
    @Binding var cardModal: CardModal?
    
    var body: some View {
        HStack(alignment: .bottom) {
            Button(action: { cardModal = .photoPicker }) {
                ToolbarButtonView(modal: .photoPicker)
            }
            
            Button(action: { cardModal = .framePicker }) {
                ToolbarButtonView(modal: .framePicker)
            }
            
            Button(action: { cardModal = .stickerPicker }) {
                ToolbarButtonView(modal: .stickerPicker)
            }
            
            Button(action: { cardModal = .textPicker }) {
                ToolbarButtonView(modal: .textPicker)
            }
        }
    }
}

struct CardBottomToolbar_Previews: PreviewProvider {
    static var previews: some View {
        CardBottomToolbar(cardModal: .constant(.stickerPicker))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
