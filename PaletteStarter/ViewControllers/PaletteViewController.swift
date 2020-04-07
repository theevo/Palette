//
//  PaletteViewController.swift
//  PaletteStarter
//
//  Created by Theo Vora on 4/7/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

class PaletteViewController: UIViewController {
    
    // MARK: - Properties
    
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    
    // MARK: - Views
    
    let featuredButton: UIButton = {
        let button = UIButton()
        button.setTitle("Featured", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let randomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Random", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let doubleRainbowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Double Rainbow", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    let paletteTableView: UITableView = UITableView()
    
    var buttons: [UIButton] {
        return [featuredButton, randomButton, doubleRainbowButton]
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addAllSubView()
        setupStackView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        activateButtons()
        paletteTableView.anchor(top: buttonStackView.bottomAnchor,
                                trailing: safeArea.trailingAnchor,
                                bottom: safeArea.bottomAnchor,
                                leading: safeArea.leadingAnchor,
                                paddingTop: 8,
                                paddingRight: 0,
                                paddingBottom: 0,
                                paddingLeft: 0)
    }
    
    
    // MARK: - UI Setup
    
    func addAllSubView() {
        view.addSubview(featuredButton)
        view.addSubview(randomButton)
        view.addSubview(doubleRainbowButton)
        view.addSubview(buttonStackView)
        view.addSubview(paletteTableView)
    }
    
    func setupStackView() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false // going full manual control. "we know what we're doing. ;)"
        buttonStackView.addArrangedSubview(featuredButton)
        buttonStackView.addArrangedSubview(doubleRainbowButton)
        buttonStackView.addArrangedSubview(randomButton)
        
        buttonStackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
    }
    
    func activateButtons() {
        buttons.forEach{$0.addTarget(self, action: #selector(searchButtonTapped(sender:)), for: .touchUpInside)}
    }
    
    @objc func searchButtonTapped(sender: UIButton) {
        print("Tapped button")
    }

}
