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
    
    var photos: [UnsplashPhoto] = []
    
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
        paletteTableView.anchor(top: buttonStackView.bottomAnchor,
                                trailing: safeArea.trailingAnchor,
                                bottom: view.bottomAnchor,
                                leading: safeArea.leadingAnchor,
                                paddingTop: 8,
                                paddingRight: 0,
                                paddingBottom: 0,
                                paddingLeft: 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
        activateButtons()
        searchButtonTapped(sender: featuredButton)
        
        
//        paletteTableView.anchor(top: buttonStackView.bottomAnchor,
//                                trailing: safeArea.trailingAnchor,
//                                bottom: safeArea.bottomAnchor,
//                                leading: safeArea.leadingAnchor,
//                                paddingTop: 8,
//                                paddingRight: 0,
//                                paddingBottom: 0,
//                                paddingLeft: 0)
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
    
    func configureTableView() {
        paletteTableView.dataSource = self
        paletteTableView.delegate = self
        paletteTableView.allowsSelection = false
        paletteTableView.register(PaletteTableViewCell.self, forCellReuseIdentifier: "paletteCell")
    }
    
    func activateButtons() {
        buttons.forEach{$0.addTarget(self, action: #selector(searchButtonTapped(sender:)), for: .touchUpInside)}
    }
    
    // MARK: - Actions
    
    
    @objc func searchButtonTapped(sender: UIButton) {
        selectButton(sender)
        switch sender {
        case featuredButton:
            searchForCategory(.featured)
        case randomButton:
            searchForCategory(.random)
        case doubleRainbowButton:
            searchForCategory(.doubleRainbow)
        default:
            print("IDK how we got here")
        }
    }
    
    // MARK: - Helper Functions
    
    func selectButton(_ button: UIButton) {
        buttons.forEach {$0.setTitleColor(.lightGray, for: .normal)}
        button.setTitleColor(.systemBlue, for: .normal)
    }
    
    func searchForCategory(_ unsplashRoute: UnsplashRoute) {
        UnsplashService.shared.fetchFromUnsplash(for: unsplashRoute) { (unsplashPhotos) in
            guard let unsplashPhotos = unsplashPhotos else { return }
            self.photos = unsplashPhotos
            DispatchQueue.main.async {
                self.paletteTableView.reloadData()
            }
        }
    }
}

// MARK: - Table View Extensions

extension PaletteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let imageViewSpace: CGFloat = (view.frame.width - (SpacingConstants.outerHorizontalPadding * 2))
        let titleLabelSpace: CGFloat = SpacingConstants.oneLineElementHeight
        let verticalPadding: CGFloat = (2 * SpacingConstants.verticalObjectBuffer)
        let outerVerticalPadding: CGFloat = (2 * SpacingConstants.outerVerticalPadding)
        let colorPaletteViewSpace: CGFloat = SpacingConstants.twoLineElementHeight
        return imageViewSpace + titleLabelSpace + verticalPadding + outerVerticalPadding + colorPaletteViewSpace
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paletteCell", for: indexPath) as! PaletteTableViewCell // we can force unwrap, because we registered in configureTableView()
        let unsplashPhoto = photos[indexPath.row]
        cell.unsplashPhoto = unsplashPhoto
        return cell
    }
    
    
}
