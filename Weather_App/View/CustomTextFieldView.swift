//
//  UITextField+.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 12/03/24.
//

import UIKit

class CustomTextFieldView: UIView {

    private let textField: UITextField
    private let leftView: UIView?
    private let rightView: UIView?
    
    private let mainStackView = UIStackView(
        arrangedSubviews: [],
        axis: .horizontal,
        spacing: 10
    )
    
    init(textField: UITextField, leftView: UIView?, rightView: UIView?) {
        self.textField = textField
        self.leftView = leftView
        self.rightView = rightView
                
        super.init(frame: .zero)
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTextFieldView {
    
    private func toFormUIElements() {
        
        
        if let leftView = leftView {
            mainStackView.addArrangedSubview(leftView)
        }
        
        mainStackView.addArrangedSubview(textField)
        mainStackView.alignment = .center
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        if let rightView = rightView {
            mainStackView.addArrangedSubview(rightView)
        }
        
        addSubview(mainStackView)
        mainStackView.leftAnchor(leftAnchor, 0)
        mainStackView.rightAnchor(rightAnchor, 0)
        mainStackView.topAnchor(topAnchor, 0)
        mainStackView.bottomAnchor(bottomAnchor, 0)

    }
    
    func setBorder(borderWidth: CGFloat, borderColor: CGColor) {
        
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
    }
    
    func contentInsets(_ layoutMargins: UIEdgeInsets) {
        
        self.mainStackView.layoutMargins = layoutMargins
        self.mainStackView.isLayoutMarginsRelativeArrangement = true
    }
}

