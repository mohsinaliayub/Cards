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
    @FocusState var textIsFocused: Bool
    
    init(textElement: Binding<TextElement>) {
        self._textElement = textElement
        self.textIsFocused = true
    }
    
    var body: some View {
        VStack {
            TextField("Enter text", text: $textElement.text)
                .focused($textIsFocused, equals: true)
                .font(.custom(textElement.textFont, size: 30))
                .foregroundColor(textElement.textColor)
                .autocorrectionDisabled()
                .padding()
                .onSubmit {
                    dismiss()
                }
            TextView(font: $textElement.textFont, color: $textElement.textColor)
        }
    }
}

struct TextPicker_Previews: PreviewProvider {
    @State static private var textElement = TextElement()
    static var previews: some View {
        TextPicker(textElement: .constant(textElement))
    }
}
