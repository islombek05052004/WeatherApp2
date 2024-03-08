//
//  Constraints+.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//
import UIKit

extension UIView {
    
    func topAnchor(_ top: NSLayoutYAxisAnchor, _ constraint: CGFloat) {
        
        self.topAnchor.constraint(equalTo: top, constant: constraint).isActive = true
    }
    
    func bottomAnchor(_ bottom: NSLayoutYAxisAnchor, _ constraint: CGFloat) {
        
        self.bottomAnchor.constraint(equalTo: bottom, constant: constraint).isActive = true
    }
    
    func leftAnchor(_ left: NSLayoutXAxisAnchor, _ constraint: CGFloat) {
        
        self.leftAnchor.constraint(equalTo: left, constant: constraint).isActive = true
    }
    
    func rightAnchor(_ right: NSLayoutXAxisAnchor, _ constraint: CGFloat) {
        
        self.rightAnchor.constraint(equalTo: right, constant: constraint).isActive = true
    }
    
    func widhtHeight(_ width: CGFloat, _ height: CGFloat) {
        
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func widthAnchor(width: CGFloat) {
        
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func heightAnchor(height: CGFloat) {
        
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func centerXAnchor(_ center: NSLayoutXAxisAnchor, _ constraint: CGFloat) {
        
        self.centerXAnchor.constraint(equalTo: center, constant: constraint).isActive = true
    }
    
    func centerYAnchor(_ center: NSLayoutYAxisAnchor, _ constraint: CGFloat) {
        
        self.centerYAnchor.constraint(equalTo: center, constant: constraint).isActive = true
    }
    
    func setShadow(_ width: Double,_ height: Double, _ color: CGColor,_ opacity: Float,_ radius: CGFloat) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = color
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowRadius = radius
    }
    
    enum Anchor {
        case left
        case right
        case top
        case bottom
        case width
        case height
    }
    
    func setConstraint(from anchor: Anchor, to view: UIView, _ constraint: CGFloat) {
        switch anchor {
            
        case .left:
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraint).isActive = true
        case .right:
            self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: constraint).isActive = true

        case .top:
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: constraint).isActive = true

        case .bottom:
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: constraint).isActive = true

        case .width:
            self.widthAnchor.constraint(equalTo: view.widthAnchor, constant: constraint).isActive = true

        case .height:
            self.heightAnchor.constraint(equalTo: view.heightAnchor, constant: constraint).isActive = true
        }
    }
}
