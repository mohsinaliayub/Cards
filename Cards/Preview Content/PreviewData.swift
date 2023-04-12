//
//  PreviewData.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 04.04.23.
//

import SwiftUI

let initialCards: [Card] = [
    Card(backgroundColor: Color("random1"), elements: initialElements),
    Card(backgroundColor: Color("random2")),
    Card(backgroundColor: Color("random3")),
    Card(backgroundColor: Color("random4")),
    Card(backgroundColor: Color("random8"))
]

let initialElements: [CardElement] = [
//    ImageElement(
//        transform: Transform(
//            size: CGSize(width: 310, height: 225),
//            rotation: .init(degrees: 10),
//            offset: CGSize(width: 5, height: -245)),
//        image: Image("hedgehog1")),
//    ImageElement(
//        transform: Transform(
//            size: CGSize(width: 330, height: 238),
//            rotation: .init(degrees: -25),
//            offset: CGSize(width: 5, height: 200)),
//        image: Image("hedgehog2")),
//    ImageElement(
//        transform: Transform(),
//        image: Image("hedgehog3")),
//    TextElement(
//        transform: Transform(
//            size: Settings.defaultElementSize * 1.2,
//            rotation: .zero,
//            offset: CGSize(width: -35, height: -125)),
//        text: "Hedgehogs!!!",
//        textColor: .blue)
    ImageElement(
        transform: Transform(
            size: CGSize(width: 370, height: 266),
            rotation: .init(degrees: -6),
            offset: CGSize(width: 4, height: -137)),
        image: Image("giraffe")),
    TextElement(
        transform: Transform(
            size: CGSize(width: 300, height: 100),
            offset: CGSize(width: 12, height: 81)),
        text: "Snack time!",
        textColor: .blue)
]
