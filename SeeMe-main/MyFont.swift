//
//  MyFont.swift
//  SeeMe
//
//  Created by Francesco De Stasio on 14/04/23.
//

import Foundation
import CoreText
import SwiftUI

struct MyFont {
    
    public static func loadFont(size: CGFloat, name: String) -> Font{
        let fontURL = Bundle.main.url(forResource: name, withExtension: ".ttf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL,
                                         CTFontManagerScope.process, nil)
        return Font.custom(name, size: size)
    }
    
}
