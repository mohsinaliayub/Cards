//
//  Transform.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

/// This structure holds the size, location on the screen and rotation angle of a view.
struct Transform {
    /// The size of the view.
    var size = CGSize(width: 250, height: 180)
    /// The rotation angle of the view on screen.
    var rotation: Angle = .zero
    /// The location of the view on screen relative to the center of its parent.
    var offset: CGSize = .zero
}
