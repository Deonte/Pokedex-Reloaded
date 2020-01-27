//
//  NetworkManager.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 1/4/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit


class NetworkManager {
    static let shared = NetworkManager()
    let cache = NSCache<NSString, UIImage>()

    let baseURL = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=150"
    let baseDetailURl = "https://pokeapi.co/api/v2/pokemon/"
    
    private init() {}
    
    
    func getPokemon(completion: @escaping([Pokemon]?, PRError?) -> Void) {
        let endpoint = baseURL
        
        guard let url = URL(string: endpoint) else {
            completion(nil, .invalidURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let _ = error {
                completion(nil, .unableToComplete)
            }
            
            guard let data = data else {
                completion(nil, .invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let pokemon = try decoder.decode(PokemonResponse.self, from: data)
                let pokemonArray = pokemon.results
                completion(pokemonArray, nil)
    
            } catch {
                completion(nil, .invalidData)
            }
            
        }
        
        task.resume()
    }
    
    
    func getPokemonDetail(for pokemonDetailURL: String , completion: @escaping(PokemonDetail?, PRError?) -> Void) {
        let endpoint = pokemonDetailURL
            
            guard let url = URL(string: endpoint) else {
                completion(nil, .invalidURL)
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
                
                if let _ = error {
                    completion(nil, .unableToComplete)
                }
                
                guard let data = data else {
                    completion(nil, .invalidData)
                    return
                }
                            
                do {
                    let decoder = JSONDecoder()
                    let detail = try decoder.decode(PokemonDetail.self, from: data)
                    completion(detail, nil)
        
                } catch {
                    completion(nil, .invalidData)
                }
                
            }
            
            task.resume()
    }
    
    
}
