//
//  ImageView+.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit

extension UIImageView {
    
    convenience init(
        image: UIImage?,
        contentMode: UIView.ContentMode
    ) {
        self.init(image: image)
        self.contentMode = contentMode
    }
}
