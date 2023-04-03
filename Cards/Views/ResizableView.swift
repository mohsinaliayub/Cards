//
//  ResizableView.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct ResizableView: View {
    private let content = RoundedRectangle(cornerRadius: 30)
    private let color = Color.red
    
    /// The transform of view.
    @State private var transform = Transform()
    
    var body: some View {
        content
            .frame(width: transform.size.width, height: transform.size.height)
            .foregroundColor(color)
    }
}

struct ResizableView_Previews: PreviewProvider {
    static var previews: some View {
        ResizableView()
    }
}
