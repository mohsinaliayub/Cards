//
//  ViewExtensions.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 04.04.23.
//

import SwiftUI

extension View {
    func resizableView(transform: Binding<Transform>, viewScale: CGFloat = 1) -> some View {
        return modifier(ResizableView(transform: transform, viewScale: viewScale))
    }
}
