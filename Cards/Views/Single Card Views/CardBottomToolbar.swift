//
//  CardBottomToolbar.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct ToolbarButtonView: View {
    typealias CardData = (text: String, systemImageName: String)
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
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
            if verticalSizeClass == .compact {
                compactView(imageName)
            } else {
                regularView(imageName, text)
            }
        }
    }
    
    private func regularView(_ imageName: String, _ text: String) -> some View {
        VStack(spacing: 2) {
            Image(systemName: imageName)
                .font(.title2)
            Text(text)
        }
        .frame(minWidth: 60)
        .padding(.top, 5)
    }
    
    private func compactView(_ imageName: String) -> some View {
        VStack(spacing: 2) {
            Image(systemName: imageName)
                .font(.title2)
        }
        .frame(minWidth: 60)
        .padding(.top, 5)
    }
}

struct CardBottomToolbar: View {
    @Binding var cardModal: CardModal?
    @EnvironmentObject var viewState: ViewState
    
    var body: some View {
        HStack(alignment: .bottom) {
            Button(action: { cardModal = .photoPicker }) {
                ToolbarButtonView(modal: .photoPicker)
            }
            
            Button(action: { cardModal = .framePicker }) {
                ToolbarButtonView(modal: .framePicker)
            }
            .disabled(viewState.selectedElement == nil || !(viewState.selectedElement.self is ImageElement))
            
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
            .environmentObject(ViewState())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
