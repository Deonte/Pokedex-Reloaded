//
//  Pokemon.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 12/29/19.
//  Copyright © 2019 Deonte. All rights reserved.
//

import Foundation


struct Response: Decodable {
    var results: [DataURL]
}


struct DataURL: Decodable {
    var url: String
}





