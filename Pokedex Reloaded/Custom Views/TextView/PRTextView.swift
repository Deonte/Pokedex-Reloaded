//
//  PRTextView.swift
//  Pokedex Reloaded
//
//  Created by Deonte on 2/19/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit

class PRTextView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        isEditable = false
        isScrollEnabled = true
        textAlignment = .justified
        font = .preferredFont(forTextStyle: .body)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
