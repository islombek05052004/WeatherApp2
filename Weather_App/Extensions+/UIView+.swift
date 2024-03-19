//
//  UIView+.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 12/03/24.
//

import UIKit


extension UIView {
    
    func setGradient() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.rgb(r: 17, g: 20, b: 44).cgColor,
            UIColor.rgb(r: 10, g: 19, b: 88).cgColor,
            UIColor.rgb(r: 3, g: 5, b: 9).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = CGRect(x: 0,
                                     y: 0,
                                     width: UIScreen.main.bounds.width,
                                     height: UIScreen.main.bounds.height)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
