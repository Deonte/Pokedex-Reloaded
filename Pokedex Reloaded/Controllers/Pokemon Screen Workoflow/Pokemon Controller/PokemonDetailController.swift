//
//  PokemonDetailController.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 1/27/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit

class PokemonDetailController: UIViewController {
    
    let spriteImageView = PRSpriteImageView(frame: .zero)
    let nameLabel = PRTitleLabel(textAlignment: .center, fontSize: 40)
    let descriptionTV = PRTextView(frame: .zero)
    
    var pokemon: PokemonDetail?

    
    init(detail: PokemonDetail) {
        super.init(nibName: nil, bundle: nil)
        self.pokemon = detail
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
        addSubviews()
        getPokemonFlavorText()
        layoutUI()
    }
    
    
    private func getPokemonFlavorText() {
        guard let url = pokemon?.species.url else { return }
        
        NetworkManager.shared.getFlavorText(from: url) { [weak self] flavorTextArray, error in
            guard let self = self else { return }
            
            guard let allFlavorText = flavorTextArray else {
                print(error!)
                return
            }
            
            for flavorText in allFlavorText {
                if flavorText.language.name == "en" && flavorText.version.name == "alpha-sapphire" {
                    let text = flavorText.flavorText.replacingOccurrences(of: "\n", with: " ") + "\n"
                    DispatchQueue.main.async {
                        self.descriptionTV.text = text
                    }
                }
            }
        }
    }
    
    
    private func configureUIElements() {
        view.backgroundColor = .systemBackground
        spriteImageView.contentMode = .scaleAspectFill
        nameLabel.text = pokemon?.name.capitalized ?? "Unknown"
    }
    
    
    private func addSubviews() {
        view.addSubview(spriteImageView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionTV)
    }
    
    
    private func layoutUI() {
        
        NSLayoutConstraint.activate([
            spriteImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            spriteImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spriteImageView.heightAnchor.constraint(equalToConstant: 300),
            spriteImageView.widthAnchor.constraint(equalToConstant: 300),
            
            nameLabel.topAnchor.constraint(equalTo: spriteImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            descriptionTV.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            descriptionTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionTV.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
}
