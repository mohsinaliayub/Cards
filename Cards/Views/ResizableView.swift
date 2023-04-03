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
    /// Hold the previous offset, because drag gesture sets value.translation to zero at start of the drag.
    @State private var previousOffset: CGSize = .zero
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                transform.offset = value.translation + previousOffset
            }
            .onEnded { _ in
                previousOffset = transform.offset
            }
        
        content
            .frame(width: transform.size.width, height: transform.size.height)
            .foregroundColor(color)
            .offset(transform.offset)
            .gesture(dragGesture)
    }
}

struct ResizableView_Previews: PreviewProvider {
    static var previews: some View {
        ResizableView()
    }
}
