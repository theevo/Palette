//
//  UIViewExtension.swift
//  PaletteStarter
//
//  Created by Theo Vora on 4/7/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?,
                trailing: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                leading: NSLayoutXAxisAnchor?,
                paddingTop: CGFloat,
                paddingRight: CGFloat,
                paddingBottom: CGFloat,
                paddingLeft: CGFloat,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            widthAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
