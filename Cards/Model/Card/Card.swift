//
//  Card.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 04.04.23.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var backgroundColor: Color = .yellow
    var elements: [CardElement] = []
    
    /// Removes the element from card, and deletes the saved image if the removed
    /// element is an image.
    mutating func remove(_ element: CardElement) {
        if let index = element.index(in: elements) {
            elements.remove(at: index)
            if let element = element as? ImageElement {
                UIImage.remove(name: element.imageFilename)
            }
            
            // After removing an element, we save the card to local disk since
            // there's an update to the card.
            save()
        }
    }
    
    mutating func addElement(uiImage: UIImage) {
        let imageFilename = uiImage.save()
        let image = Image(uiImage: uiImage)
        
        let element = ImageElement(image: image, imageFilename: imageFilename)
        elements.append(element)
        
        // We added new element, so save to disk.
        save()
    }
    
    
    /// Updates the card element with a frame(shape).
    ///
    /// The frame is only applied to image elements. We create the new element, apply the frame to it
    /// and then replace the existing element with new element.
    /// - Parameters:
    ///   - element: The element to update.
    ///   - frame: The shape to apply.
    mutating func update(_ element: CardElement?, frame: AnyShape) {
        if let element = element as? ImageElement,
           let index = element.index(in: elements) {
            var newElement = element
            newElement.frame = frame
            elements[index] = newElement
            
            // After updating, save the card to local disk.
            save()
        }
    }
    
    func save() {
        let filename = "\(id).card"
        guard let fileURL = FileManager.documentURL?.appending(path: filename) else {
            return
        }
        
        do {
            let encoder = JSONEncoder(); encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(self)
            
            try data.write(to: fileURL)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension Card: Codable {
    enum CodingKeys: CodingKey {
        case id, backgroundColor, imageElements, textElements
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let id = try container.decode(String.self, forKey: .id)
        self.id = UUID(uuidString: id) ?? UUID()
        let colorComponents = try container.decode([CGFloat].self, forKey: .backgroundColor)
        backgroundColor = Color.color(components: colorComponents)
        
        elements += try container.decode([ImageElement].self, forKey: .imageElements)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id.uuidString, forKey: .id)
        try container.encode(backgroundColor.colorComponents(), forKey: .backgroundColor)
        
        let imageElements = elements.compactMap { $0 as? ImageElement }
        try container.encode(imageElements, forKey: .imageElements)
    }
}
