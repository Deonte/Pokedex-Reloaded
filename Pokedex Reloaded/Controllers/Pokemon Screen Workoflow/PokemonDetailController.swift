//
//  PokemonDetailController.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 1/27/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit

class PokemonDetailController: UIViewController {
    
    var detailURL: String?
    let spriteImageView = PRSpriteImageView(frame: .zero)
    
    
    init(detailURL: String) {
        super.init(nibName: nil, bundle: nil)
        self.detailURL = detailURL
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPokemonDetail(for: detailURL!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        layoutUI()
    }
    
    
    private func getPokemonDetail(for url: String) {
        NetworkManager.shared.getPokemonDetail(for: url) { [weak self] detail, errorMessage in
            guard let self = self else { return }
            guard let detail = detail else {
                print(errorMessage!)
                return
            }
            
            DispatchQueue.main.async {
                print(detail)
                self.spriteImageView.downloadImage(from: detail.sprites.front_default)
            }
            
        }
    }
    
    
    private func configure() {
        view.backgroundColor = .systemBackground
        spriteImageView.contentMode = .scaleAspectFill
    }
    
    
    private func addSubviews() {
        view.addSubview(spriteImageView)
    }
    
    
    private func layoutUI() {
        
        NSLayoutConstraint.activate([
            spriteImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spriteImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spriteImageView.heightAnchor.constraint(equalToConstant: 300),
            spriteImageView.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
}
