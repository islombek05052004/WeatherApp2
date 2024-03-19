//
//  UITextField+.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 31/01/24.
//

import UIKit

extension UITextField {
    
    convenience init(backColor: UIColor,
                     placeholder: String?,
                     font: UIFont = .systemFont(ofSize: 22, weight: .regular),
                     autoCorrectType: UITextAutocorrectionType = .no,
                     borderStyle: BorderStyle = .roundedRect
    ) {
        self.init()
        self.backgroundColor = backColor
        self.autocorrectionType = autoCorrectType
        self.borderStyle = borderStyle
        self.placeholder = placeholder
        self.font = font
    }
    
}
