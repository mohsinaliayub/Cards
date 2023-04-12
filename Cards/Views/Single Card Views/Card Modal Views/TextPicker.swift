//
//  TextPicker.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 12.04.23.
//

import SwiftUI

struct TextPicker: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var textElement: TextElement
    
    var body: some View {
        TextField("Enter text", text: $textElement.text)
            .textFieldStyle(.roundedBorder)
            .font(.custom(textElement.textFont, size: 20))
            .autocorrectionDisabled()
            .padding()
            .onSubmit {
                dismiss()
            }
    }
}

struct TextPicker_Previews: PreviewProvider {
    @State static private var textElement = TextElement()
    static var previews: some View {
        TextPicker(textElement: .constant(textElement))
    }
}
