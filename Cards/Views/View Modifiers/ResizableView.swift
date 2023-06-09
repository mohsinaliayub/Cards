//
//  ResizableView.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct ResizableView: ViewModifier {
    /// The transform of view.
    @Binding var transform: Transform
    /// Hold the previous offset, because drag gesture sets value.translation to zero at start of the drag.
    @State private var previousOffset: CGSize = .zero
    /// Hold the previous rotation angle.
    ///
    /// The previous rotation angle will be stored as long as the user is rotation. After the
    /// user removes their finger from the screen, it will be set back to .zero.
    @State private var previousRotation: Angle = .zero
    /// The size of the view when you're scaling.
    ///
    /// It will be set back to 1 after the magnification gesture is finished.
    @State private var scale: CGFloat = 1.0
    
    private let viewScale: CGFloat
    
    init(transform: Binding<Transform>, viewScale: CGFloat = 1) {
        _transform = transform; self.viewScale = viewScale
    }
    
    func body(content: Content) -> some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                transform.offset = value.translation / viewScale + previousOffset
            }
            .onEnded { _ in
                previousOffset = transform.offset
            }
        
        let rotationGesture = RotationGesture()
            .onChanged { rotation in
                transform.rotation += rotation - previousRotation
                previousRotation = rotation
            }
            .onEnded { _ in
                previousRotation = .zero
            }
        
        let scaleGesture = MagnificationGesture()
            .onChanged { scale in
                self.scale = scale
            }
            .onEnded { scale in
                transform.size.width *= scale; transform.size.height *= scale
                self.scale = 1.0
            }
        
        content
            .frame(width: transform.size.width * viewScale,
                   height: transform.size.height * viewScale)
            .rotationEffect(transform.rotation)
            .scaleEffect(scale)
            .offset(transform.offset * viewScale)
            .gesture(dragGesture)
            .gesture(SimultaneousGesture(rotationGesture, scaleGesture))
            .onAppear {
                previousOffset = transform.offset
            }
    }
}

struct ResizableView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangle(cornerRadius: 30.0)
            .foregroundColor(.red)
            .modifier(ResizableView(transform: .constant(Transform())))
    }
}
