//
//  AnyShape.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 11.04.23.
//

import SwiftUI

struct AnyShape: Shape {
    private let path: (CGRect) -> Path
    
    init<CustomShape: Shape>(_ shape: CustomShape) {
        self.path = { rect in
            shape.path(in: rect)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        path(rect)
    }
}

extension AnyShape: Equatable {
    
    // Create the path of both shapes in a small rectangle.
    // Then compare the two paths to see if they are the same.
    // REMEMBER: Don't set the size of rectanlge to zero, it'll produce
    //           unexpected results.
    static func == (lhs: AnyShape, rhs: AnyShape) -> Bool {
        let rect = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        let lhsPath = lhs.path(in: rect)
        let rhsPath = rhs.path(in: rect)
        
        return lhsPath == rhsPath
    }
    
}
