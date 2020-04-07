//
//  ColorPaletteView.swift
//  PaletteStarter
//
//  Created by Theo Vora on 4/7/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

class ColorPaletteView: UIView {
    
    // MARK: - Properties
    
    var colors: [UIColor] {
        didSet {
            buildColorBricks()
        }
    }
    
    
    // MARK: - Views
    
    lazy var colorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    
    // MARK: - Lifecycles
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    init(colors: [UIColor] = [], frame: CGRect = .zero) {
        self.colors = colors
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup UI
    
    private func setUpViews() {
        addSubview(colorStackView)
        colorStackView.anchor(top: topAnchor,
                              trailing: trailingAnchor,
                              bottom: bottomAnchor,
                              leading: leadingAnchor,
                              paddingTop: 0,
                              paddingRight: 0,
                              paddingBottom: 0,
                              paddingLeft: 0)
        buildColorBricks()
    }
    
    
    // MARK: -  Helper Functions
    
    private func generateColorBlock(color: UIColor) -> UIView {
        let colorBlock = UIView()
        colorBlock.backgroundColor = color
        return colorBlock
    }
    
    private func buildColorBricks() {
        resetColorBricks()
        for color in self.colors {
            let colorBlock = self.generateColorBlock(color: color)
            self.addSubview(colorBlock)
            self.colorStackView.addArrangedSubview(colorBlock)
        }
        self.layoutIfNeeded() // "hey we need to get this done now"
    }
    
    private func resetColorBricks() {
        for subview in colorStackView.arrangedSubviews {
            self.colorStackView.removeArrangedSubview(subview)
        }
    }
}
