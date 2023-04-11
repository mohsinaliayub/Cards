//
//  FramePicker.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 11.04.23.
//

import SwiftUI

struct FramePicker: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var frame: AnyShape?
    
    private let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10)
    ]
    private let style = StrokeStyle(lineWidth: 5, lineJoin: .round)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<Shapes.shapes.count, id: \.self) { index in
                    Shapes.shapes[index]
                        .stroke(Color.primary, style: style)
                        .background(Shapes.shapes[index].fill(Color.secondary))
                        .frame(width: 100, height: 120)
                        .padding()
                        .onTapGesture {
                            frame = Shapes.shapes[index]
                            dismiss()
                        }
                }
            }
        }
        .padding(5)
    }
}

struct FramePicker_Previews: PreviewProvider {
    static var previews: some View {
        FramePicker(frame: .constant(nil))
    }
}
