//
//  CardElement.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 04.04.23.
//

import SwiftUI

protocol CardElement {
    var id: UUID { get }
    var transform: Transform { get set }
}

extension CardElement {
    func index(in array: [CardElement]) -> Int? {
        array.firstIndex { $0.id == id }
    }
}

struct ImageElement: CardElement {
    let id = UUID()
    var transform = Transform()
    var image: Image
    var frame: AnyShape?
    var imageFilename: String?
}

extension ImageElement: Codable {
    enum CodingKeys: CodingKey {
        case transform, imageFilename, frame
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        transform = try container.decode(Transform.self, forKey: .transform)
        imageFilename = try container.decodeIfPresent(String.self, forKey: .imageFilename)
        if let imageFilename = imageFilename,
           let uiImage = UIImage.load(uuidString: imageFilename) {
            image = Image(uiImage: uiImage)
        } else {
            image = Image("error-image")
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transform, forKey: .transform)
        try container.encode(imageFilename, forKey: .imageFilename)
    }
}

struct TextElement: CardElement {
    let id = UUID()
    var transform = Transform()
    var text = ""
    var textColor = Color.black
    var textFont = "San Fransisco"
}
