//
//  Settings.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 04.04.23.
//

import SwiftUI

enum Settings {
    static let cardSize = CGSize(width: 1300, height: 2000)
    static let defaultElementSize = CGSize(width: 800, height: 800)
    static let borderColor: Color = .blue
    static let borderWidth: CGFloat = 5
    
    /// Calculates the card's thumbnail size for a card based on available space.
    ///
    /// If the screen size is greater than 500 points for both width & height, the card
    /// size will be scaled to 20% of its actual size. Otherwise, it'll scale to 12% of its
    /// actual size.
    static func thumbnailSize(size: CGSize) -> CGSize {
        // width & height threshold of screen in points
        let threshold: CGFloat = 500
        // scale factor for the card
        var scale: CGFloat = 0.12
        if size.width > threshold && size.height > threshold {
            scale = 0.2
        }
        
        return CGSize(width: Settings.cardSize.width * scale,
                      height: Settings.cardSize.height * scale)
    }
}
