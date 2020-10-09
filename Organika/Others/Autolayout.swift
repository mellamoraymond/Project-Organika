//
//  UIViewExtension.swift
//  Organika
//
//  Created by Engr. John Raymond Ilagan on 10/5/20.
//  Copyright © 2020 John Raymond Ilagan. All rights reserved.
//

import UIKit

extension UIView {
    
    func fillSuperView() {
        
        anchor(
            top: superview?.topAnchor,
            bottom: superview?.bottomAnchor,
            leading: superview?.leadingAnchor,
            trailing: superview?.trailingAnchor)
    }
    
    func anchorSize(to view: UIView) {
        
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(
        top: NSLayoutYAxisAnchor?,
        bottom: NSLayoutYAxisAnchor?,
        leading: NSLayoutXAxisAnchor?,
        trailing: NSLayoutXAxisAnchor?,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
}
