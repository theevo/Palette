//
//  PaletteTableViewCell.swift
//  PaletteStarter
//
//  Created by Theo Vora on 4/7/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

class PaletteTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var unsplashPhoto: UnsplashPhoto? {
        didSet {
            updateView()
        }
    }
    
    
    // MARK: - Views
    
    
    // MARK: - Lifecycle
    
    
    // MARK: - Update/setup UI
    
    func updateView() {
        
    }
    
    // MARK: - Helper Functions
    
    
}
