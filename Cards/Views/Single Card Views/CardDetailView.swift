//
//  CardDetailView.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var viewState: ViewState
    @Environment(\.scenePhase) private var scenePhase
    @State private var currentModal: CardModal?
    @State private var stickerImage: UIImage?
    @State private var images: [UIImage] = []
    @State private var frame: AnyShape?
    @Binding var card: Card
    @State private var textElement = TextElement()
    
    var content: some View {
        ZStack {
            card.backgroundColor
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    viewState.selectedElement = nil
                }
            ForEach(card.elements, id: \.id) { element in
                CardElementView(element: element,
                                selected: viewState.selectedElement?.id == element.id)
                    .contextMenu {
                        Button(action: { card.remove(element)}) {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    .resizableView(transform: bindingTransform(for: element))
                    .frame(width: element.transform.size.width,
                           height: element.transform.size.height)
                    .onTapGesture {
                        viewState.selectedElement = element
                    }
            }
        }
    }
    
    var body: some View {
        content
            .onChange(of: scenePhase, perform: { newScenePhase in
                if newScenePhase == .inactive {
                    card.save()
                }
            })
            .onDisappear {
                card.save()
            }
            .onDrop(of: [.image], delegate: CardDrop(card: $card))
            .modifier(CardToolbar(currentModal: $currentModal))
            .cardModals(card: $card, currentModal: $currentModal)
    }
    
    private func bindingTransform(for element: CardElement) -> Binding<Transform> {
        guard let index = element.index(in: card.elements) else {
            fatalError("Element does not exist")
        }
        
        return $card.elements[index].transform
    }
}

struct CardDetailView_Previews: PreviewProvider {
    struct CardDetailPreview: View {
        @State private var card = initialCards[0]
        var body: some View {
            CardDetailView(card: $card)
                .environmentObject(ViewState(card: card))
        }
    }
    
    static var previews: some View {
        CardDetailPreview()
    }
}
