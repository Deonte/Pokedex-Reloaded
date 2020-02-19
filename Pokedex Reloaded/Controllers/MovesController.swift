//
//  MovesController.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 12/29/19.
//  Copyright © 2019 Deonte. All rights reserved.
//

import UIKit

class MovesController: PRControllerWithSearch {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureSearchController()
    }
 
}
