//
//  UIViewController+ext.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 2/19/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit

extension UISearchController {
    
    func configure(with title: String) {
        navigationItem.hidesSearchBarWhenScrolling = false
        obscuresBackgroundDuringPresentation = false
        searchBar.placeholder = title
    }
    
}
