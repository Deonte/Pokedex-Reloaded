//
//  Pokemon.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 12/29/19.
//  Copyright © 2019 Deonte. All rights reserved.
//

import Foundation


struct PokemonResponse: Decodable {
    var results: [Pokemon]
}


struct Pokemon: Decodable {
    var name: String
    var url: String
}





