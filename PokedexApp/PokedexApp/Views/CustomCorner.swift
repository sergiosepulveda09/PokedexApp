//
//  CustomCorner.swift
//  PokedexApp
//
//  Created by Sergio Sepulveda on 2021-06-01.
//

import SwiftUI

struct CustomCorner: Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}
