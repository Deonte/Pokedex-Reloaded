//
//  MovesController.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 12/29/19.
//  Copyright © 2019 Deonte. All rights reserved.
//

import UIKit

class MovesController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating{
   
    let searchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureSearchController()
    }
    
    
    private func configureSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Moves"
        searchController.searchResultsUpdater = self
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}
