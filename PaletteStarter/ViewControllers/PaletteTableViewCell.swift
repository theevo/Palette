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
    lazy var paletteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var paletteTitleLabel: UILabel = UILabel()
    
    lazy var colorPaletteView: ColorPaletteView = ColorPaletteView()
    
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        colorPaletteView.colors = [.lightGray]
    }
    
    
    // MARK: - Update/setup UI
    
    func updateView() {
        guard let unsplashPhoto = unsplashPhoto else { return }
        fetchAndSetImage(for: unsplashPhoto)
        fetchAndSetColors(for: unsplashPhoto)
        paletteTitleLabel.text = unsplashPhoto.description
    }
    
    func setupView() {
        addAllSubViews()
        
        let imageWidth = (contentView.frame.width - (SpacingConstants.outerHorizontalPadding * 2))
        
        paletteImageView.anchor(top: contentView.topAnchor,
                                trailing: contentView.trailingAnchor,
                                bottom: nil,
                                leading: contentView.leadingAnchor,
                                paddingTop: SpacingConstants.outerVerticalPadding,
                                paddingRight: SpacingConstants.outerHorizontalPadding,
                                paddingBottom: 0,
                                paddingLeft: SpacingConstants.outerHorizontalPadding,
                                width: imageWidth,
                                height: imageWidth)
        
        paletteTitleLabel.anchor(top: paletteImageView.bottomAnchor,
                                 trailing: contentView.trailingAnchor,
                                 bottom: nil,
                                 leading: contentView.leadingAnchor,
                                 paddingTop: SpacingConstants.verticalObjectBuffer,
                                 paddingRight: SpacingConstants.outerHorizontalPadding,
                                 paddingBottom: 0,
                                 paddingLeft: SpacingConstants.outerHorizontalPadding,
                                 width: nil,
                                 height: SpacingConstants.oneLineElementHeight)
        
        colorPaletteView.anchor(top: paletteImageView.bottomAnchor,
                                trailing: contentView.trailingAnchor,
                                bottom: contentView.bottomAnchor,
                                leading: contentView.leadingAnchor,
                                paddingTop: SpacingConstants.verticalObjectBuffer,
                                paddingRight: SpacingConstants.outerHorizontalPadding,
                                paddingBottom: SpacingConstants.outerVerticalPadding,
                                paddingLeft: SpacingConstants.outerHorizontalPadding,
                                width: nil,
                                height: SpacingConstants.twoLineElementHeight)
        colorPaletteView.clipsToBounds = true
        colorPaletteView.layer.cornerRadius = colorPaletteView.frame.height / 2
        
    }
    
    func addAllSubViews() {
        addSubview(paletteImageView)
        addSubview(paletteTitleLabel)
        addSubview(colorPaletteView)
    }
    
    // MARK: - Helper Functions
    
    func fetchAndSetImage(for unsplashPhoto: UnsplashPhoto) {
        UnsplashService.shared.fetchImage(for: unsplashPhoto) { (image) in
            DispatchQueue.main.async {
                self.paletteImageView.image = image
            }
        }
    }
    
    func fetchAndSetColors(for unsplashPhoto: UnsplashPhoto) {
        ImaggaService.shared.fetchColorsFor(imagePath: unsplashPhoto.urls.regular) { (colors) in
            guard let colors = colors else { return }
            DispatchQueue.main.async {
                self.colorPaletteView.colors = colors
            }
        }
    }
}
