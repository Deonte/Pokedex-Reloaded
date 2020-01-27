//
//  PokemonController.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 12/29/19.
//  Copyright © 2019 Deonte. All rights reserved.
//

import UIKit

class PokemonController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: nil)
    var pokemon = [Pokemon]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        configureTableView()
        getPokemon()
    }
    
    
    func configureTableView() {
        view.backgroundColor = .systemBackground
        tableView.register(PokemonCell.self, forCellReuseIdentifier: PokemonCell.reuseID)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: PokemonCell.reuseID, for: indexPath) as! PokemonCell
        
        let pokemon = self.pokemon[indexPath.row]
        cell.set(pokemon: pokemon.url)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = self.pokemon[indexPath.row]
        let detailController = PokemonDetailController(detailURL: pokemon.url)
        
        present(detailController, animated: true)
        
    }
    
    
    func getPokemon() {
        NetworkManager.shared.getPokemon { [weak self] pokemon, errorMessage in
            guard let self = self else { return }
            guard let pokemon = pokemon else { return }
            self.pokemon = pokemon
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
    private func configureSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Pokemon"
        searchController.searchResultsUpdater = self
    }
}
