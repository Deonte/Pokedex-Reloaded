//
//  Formattable+ext.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 1/27/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import Foundation


protocol Formattable {
    func format(pattern: String) -> String
}


extension Formattable where Self: CVarArg {
    func format(pattern: String) -> String {
        return String(format: pattern, arguments: [self])
    }
}


extension Int: Formattable { }
