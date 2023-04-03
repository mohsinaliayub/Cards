//
//  ColorExtensions.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 04.04.23.
//

import SwiftUI

extension Color {
    /// An array of most used colors.
    ///
    /// Contains: green, red, blue, gray, yellow, pink, orange and purple colors.
    static let colors: [Color] = [
        .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple
    ]
    
    
    /// Picks a random color from "colors" type property.
    /// - Returns: a random color or a default black color
    static func random() -> Color {
        colors.randomElement() ?? .black
    }
}
