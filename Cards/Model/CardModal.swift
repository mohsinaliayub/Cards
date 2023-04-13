//
//  CardModal.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import Foundation

enum CardModal: Identifiable {
    var id: Int { hashValue }
    case photoPicker, framePicker, stickerPicker, textPicker
    case shareSheet
}
