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
    
    /// Convert a color to its aRGB components.
    /// - Returns: An array of [red, green, blue, alpha] color components.
    func colorComponents() -> [CGFloat] {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: &alpha)
        return [red, green, blue, alpha]
    }
    
    /// Create a color from red, green, blue and alpha components.
    ///
    /// - Parameter components: Array of color components [red, green, blue, alpha] specifically in that order.
    static func color(components color: [CGFloat]) -> Color {
        let uiColor = UIColor(
            red: color[0],
            green: color[1],
            blue: color[2],
            alpha: color[3])
        return Color(uiColor)
    }
}
