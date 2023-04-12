//
//  Operators.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 04.04.23.
//

import Foundation

// Adds two CGSize together.
func + (left: CGSize, right: CGSize) -> CGSize {
    CGSize(width: left.width + right.width,
           height: left.height + right.height)
}

// Multiply a CGSize by a scalar.
func * (left: CGSize, right: CGFloat) -> CGSize {
    CGSize(width: left.width * right,
           height: left.height * right)
}

func / (left: CGSize, right: CGFloat) -> CGSize {
    CGSize(
        width: left.width / right,
        height: left.height / right
    )
}
