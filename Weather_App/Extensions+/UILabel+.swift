//
//  UILabel+.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit

extension UILabel {
    
    convenience init (
        text: String?,
        textColor: UIColor = .white,
        textAlignment: NSTextAlignment = .left,
        font: UIFont? = .systemFont(ofSize: 17, weight: .regular)
    ) {
        self.init()
        self.text = text
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font
    }
    
}


