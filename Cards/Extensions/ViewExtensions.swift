//
//  ViewExtensions.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 04.04.23.
//

import SwiftUI

extension View {
    func resizableView(transform: Binding<Transform>) -> some View {
        return modifier(ResizableView(transform: transform))
    }
}
