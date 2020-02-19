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

    let baseURL = "https://pokeapi.co/api/v2/"
    let query = "?offset=0&limit=151"
    
    let baseDetailURl = "https://pokeapi.co/api/v2/pokemon/"
    
    private init() {}
    
    
    func getData(from parameter: String, completion: @escaping([DataURL]?, PRError?) -> Void) {
        let endpoint = baseURL + parameter  + query
        
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
                let dataResponse = try decoder.decode(Response.self, from: data)
                let urls = dataResponse.results
                completion(urls, nil)
    
            } catch {
                completion(nil, .invalidData)
            }
            
        }
        
        task.resume()
    }
    
    
    func getPokemonDetail(from pokemonDetailURL: String , completion: @escaping(PokemonDetail?, PRError?) -> Void) {
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
    
    
    func getFlavorText(from url: String , completion: @escaping([FlavorText]? , PRError?) -> Void) {
        let endpoint = url
        
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
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let entries = try decoder.decode(FlavorTextEntries.self, from: data)
                let flavorTextArray = entries.flavorTextEntries
                
                completion(flavorTextArray, nil)
                
            } catch {
                completion(nil, .invalidData)
            }
            
        }
        
        task.resume()
    }
    
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
          let cacheKey = NSString(string: urlString)
          
          if let image = cache.object(forKey: cacheKey) {
              completed(image)
              return
          }
          
          guard let url = URL(string: urlString) else {
              completed(nil)
              return
          }
          
          let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
              
              guard let self = self,
              error == nil,
              let response = response as? HTTPURLResponse, response.statusCode == 200,
              let data = data,
              let image = UIImage(data:  data) else {
                  completed(nil)
                  return
              }
              
              self.cache.setObject(image, forKey: cacheKey)
              completed(image)
          }
          
          task.resume()
      }
   
}
