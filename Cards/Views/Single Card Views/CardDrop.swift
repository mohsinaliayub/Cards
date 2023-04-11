//
//  CardDrop.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 11.04.23.
//

import SwiftUI

struct CardDrop: DropDelegate {
    @Binding var card: Card
    
    func performDrop(info: DropInfo) -> Bool {
        let itemProviders = info.itemProviders(for: [.image])
        
        for itemProvider in itemProviders {
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { image, _ in
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            card.addElement(uiImage: image)
                        }
                    }
                }
            }
        }
        
        return true
    }
}
