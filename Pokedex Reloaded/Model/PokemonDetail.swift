//
//  PokemonDetail.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 1/4/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import Foundation

struct PokemonDetail: Codable {
    var id: Int
    var name: String
    var types: [PokeTypes]
    var sprites: Sprites
    var species: Species
}


struct Species: Codable {
    var url: String
}


struct Sprites: Codable {
    var front_default: String
    var back_default: String
}


struct PokeTypes: Codable {
    var slot: Int
    var type: Type
}


struct Type: Codable {
    var name: String
    var url: String
}



