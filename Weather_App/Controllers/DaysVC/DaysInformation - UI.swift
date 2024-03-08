//
//  DaysInformation - UI.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit

final class DaysInformationVCHomeView: UIView {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DaysInformationVCHomeView {
    
    private func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.rgb(r: 17, g: 20, b: 44).cgColor,
            UIColor.rgb(r: 10, g: 19, b: 48).cgColor,
            UIColor.rgb(r: 3, g: 5, b: 9).cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0,
                                     y: 0,
                                     width: UIScreen.main.bounds.width,
                                     height: UIScreen.main.bounds.height)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

