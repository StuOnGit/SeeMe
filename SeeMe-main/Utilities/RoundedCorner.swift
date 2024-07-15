//
//  SwiftUIView.swift
//  
//
//  Created by Francesco De Stasio on 11/04/23.
//

import SwiftUI

struct RoundedCorner: Shape, InsettableShape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    var insetAmount: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect.insetBy(dx: insetAmount, dy: insetAmount), byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }

    func inset(by amount: CGFloat) -> some InsettableShape {
        var roundedCorner = self
        roundedCorner.insetAmount += amount
        return roundedCorner
    }
}


