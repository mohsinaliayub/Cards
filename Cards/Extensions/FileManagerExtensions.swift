//
//  FileManagerExtensions.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 11.04.23.
//

import Foundation

extension FileManager {
    static var documentURL: URL? {
        Self.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }
}
