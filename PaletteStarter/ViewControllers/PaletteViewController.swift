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
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addAllSubView()
        setupStackView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
    }
    
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
        buttonStackView.addArrangedSubview(randomButton)
        buttonStackView.addArrangedSubview(doubleRainbowButton)
        
        buttonStackView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
