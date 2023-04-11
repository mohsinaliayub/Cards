//
//  CardStore.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 04.04.23.
//

import SwiftUI

class CardStore: ObservableObject {
    @Published var cards = [Card]()
    
    init(defaultData: Bool = false) {
        // load cards from file, if we're not using the preview content
        cards = defaultData ? initialCards : load()
    }
    
    func index(for card: Card) -> Int? {
        cards.firstIndex  { $0.id == card.id }
    }
    
    func remove(_ card: Card) {
        if let index = index(for: card) {
            cards.remove(at: index)
        }
    }
}

extension CardStore {
    /// Load cards from local data storage.
    func load() -> [Card] {
        var cards = [Card]()
        
        guard let path = FileManager.documentURL?.path(),
              let enumerator = FileManager.default.enumerator(atPath: path),
              let files = enumerator.allObjects as? [String]
        else { return cards }
        
        let cardFiles = files.filter { $0.contains(".card") }
        for cardFile in cardFiles {
            do {
                let path = "\(path)/\(cardFile)"
                let data = try Data(contentsOf: URL(filePath: path))
                
                let card = try JSONDecoder().decode(Card.self, from: data)
                cards.append(card)
            } catch {
                print("Error:", error.localizedDescription)
            }
        }
        
        return cards
    }
    
    func addCard() -> Card {
        let card = Card(backgroundColor: Color.random())
        cards.append(card)
        card.save()
        
        return card
    }
}
