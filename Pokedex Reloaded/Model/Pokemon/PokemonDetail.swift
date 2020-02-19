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
    var weight: Int
}


struct Species: Codable {
    var url: String
}


struct FlavorTextEntries: Codable {
    var flavorTextEntries: [FlavorText]
}


struct FlavorText: Codable {
    var language: Language
    var flavorText: String
    var version: Version
}


struct Version: Codable {
    let name: String
}


struct Language: Codable {
    let name: String
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
}



