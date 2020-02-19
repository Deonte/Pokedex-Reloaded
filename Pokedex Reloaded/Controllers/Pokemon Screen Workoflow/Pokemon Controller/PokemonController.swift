//
//  PokemonController.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 12/29/19.
//  Copyright © 2019 Deonte. All rights reserved.
//

import UIKit

class PokemonController: PRControllerWithSearch {
        
    var pokemonUrls   = [DataURL]()
    var pokemonDetail = [PokemonDetail]()
    var sortedPokemon = [PokemonDetail]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        configureTableView()
        getPokemon()
    }
    
    
    private func configureTableView() {
        view.backgroundColor = .systemBackground
        tableView.register(PokemonCell.self, forCellReuseIdentifier: PokemonCell.reuseID)
    }
    
    
    private func getPokemon() {
        NetworkManager.shared.getData(from: Parameters.pokemon) { [weak self] pokemon, errorMessage in
            guard let self = self else { return }
            guard let pokemonURLS = pokemon else { return }
            self.pokemonUrls = pokemonURLS
            
            self.pokemonUrls.forEach { pokemon in
                DispatchQueue.main.async {
                    self.getPokemonDetail(from: pokemon.url)
                }
            }
        }
    }
    
    
    private func getPokemonDetail(from url: String) {
        NetworkManager.shared.getPokemonDetail(from: url) { [weak self] detail, errorMessage in
            guard let self = self else { return }
            guard let detail = detail else {
                print(errorMessage!)
                return
            }
            
            self.pokemonDetail.append(detail)
            self.sortedPokemon = self.pokemonDetail.sorted(by: { $0.id < $1.id})
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}


extension PokemonController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: PokemonCell.reuseID, for: indexPath) as! PokemonCell
        
        let pokemon = self.sortedPokemon[indexPath.row]
        cell.set(pokemon: pokemon)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = self.sortedPokemon[indexPath.row]
        let detailController = PokemonDetailController(detail: pokemon)
        
        let cell = tableView.cellForRow(at: indexPath) as! PokemonCell
        detailController.spriteImageView.image = cell.spriteImageView.image
        
        present(detailController, animated: true)
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedPokemon.count
    }
    
}
