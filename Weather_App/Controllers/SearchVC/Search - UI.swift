//
//  Search - UI.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 12/03/24.
//

import UIKit

class SearchVCHomeView: UIView {
    
    let searchTextField = UITextField(
        backColor: .clear,
        font: .futura(fontSize: 20),
        borderStyle: .none
    )
        
    let tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInset = .init(top: 0, left: 0, bottom: 60, right: 0)
        tableView.register(SearchTableCell.self, forCellReuseIdentifier: SearchTableCell.identifier)
        return tableView
    }()
    
    private let searchImageView = UIImageView(
        image: UIImage(named: "search")?.withTintColor(.white),
        contentMode: .scaleAspectFit
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        UITextField.appearance().tintColor = .cyan
        UITextField.appearance().keyboardAppearance = UIKeyboardAppearance.dark

        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(endEditing(swipe: )))
        tableView.addGestureRecognizer(swipe)
        
        setGradient()
        toFormUIElements()
    }
    
    @objc func endEditing(swipe: UISwipeGestureRecognizer) {
        if swipe.direction == .down {
            endEditing(true)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchVCHomeView {
    
    private func toFormUIElements() {
        
        let textFieldCustomView = CustomTextFieldView(
            textField: searchTextField,
            leftView: searchImageView,
            rightView: nil
        )
        
        searchTextField.returnKeyType = .search
        searchTextField.textColor = .white
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]
        )
        
        textFieldCustomView.clipsToBounds = true
        textFieldCustomView.layer.cornerRadius = 20
        textFieldCustomView.translatesAutoresizingMaskIntoConstraints = false
        textFieldCustomView.contentInsets(.init(top: 10, left: 20, bottom: 10, right: 20))
        textFieldCustomView.setBorder(borderWidth: 1, borderColor: UIColor.gray.cgColor)
        
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        searchImageView.widhtHeight(25, 25)
        
        addSubview(tableView)
        addSubview(textFieldCustomView)
        
        textFieldCustomView.leftAnchor(leftAnchor, 20)
        textFieldCustomView.rightAnchor(rightAnchor, -20)
        textFieldCustomView.topAnchor(safeAreaLayoutGuide.topAnchor, 0)
        textFieldCustomView.heightAnchor(height: 60)
        
        tableView.topAnchor(textFieldCustomView.bottomAnchor, 10)
        tableView.leftAnchor(leftAnchor, 0)
        tableView.rightAnchor(rightAnchor, 0)
        tableView.bottomAnchor(bottomAnchor, 0)
    }
}
