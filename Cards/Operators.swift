//
//  Operators.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 04.04.23.
//

import Foundation

func + (left: CGSize, right: CGSize) -> CGSize {
    CGSize(width: left.width + right.width,
           height: left.height + right.height)
}
