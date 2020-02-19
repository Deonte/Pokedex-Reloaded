//
//  PRControllerWithSearch.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 2/19/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit

class PRControllerWithSearch: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating  {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var screenTitle: String?
    
    init(title: String, tabBarImage: UIImage, tag: Int) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.screenTitle = title
        self.tabBarItem = UITabBarItem(title: title, image: tabBarImage, tag: tag)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    func configureSearchController() {
        guard let title = screenTitle else { return }
        searchController.configure(with: "Search \(title)")
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
}
