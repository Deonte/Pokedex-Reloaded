//
//  PokemonCell.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 1/26/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    static let reuseID = "PokemonCell"
    let spriteImageView = PRSpriteImageView(frame: .zero)
    let nameLabel = PRTitleLabel(textAlignment: .left, fontSize: 24)
    let pokedexIDLabel = PRSubtitleLabel(fontSize: 20)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(pokemon: String) {
        
        getPokemonDetail(for: pokemon)
        
    }
    
    
    private func getPokemonDetail(for url: String) {
        NetworkManager.shared.getPokemonDetail(for: url) { [weak self] detail, errorMessage in
            guard let self = self else { return }
            guard let detail = detail else {
                print(errorMessage!)
                return
            }
            
            DispatchQueue.main.async {
                self.nameLabel.text = detail.name.capitalized
                self.spriteImageView.downloadImage(from: detail.sprites.front_default)
                self.pokedexIDLabel.text = detail.id.format(pattern: "#%03d")
            }
            
        }
    }
    
    
    private func configure() {
        addSubview(spriteImageView)
        addSubview(nameLabel)
        addSubview(pokedexIDLabel)
    
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            
            spriteImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            spriteImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            spriteImageView.heightAnchor.constraint(equalToConstant: 80),
            spriteImageView.widthAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: spriteImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: spriteImageView.trailingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 32),
            
            pokedexIDLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            pokedexIDLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            pokedexIDLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            pokedexIDLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
}
