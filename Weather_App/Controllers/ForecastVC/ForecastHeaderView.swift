//
//  ForecastHeaderView.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 14/03/24.
//

import UIKit

class ForecastHeaderView: UICollectionReusableView {
    
    static let identifier = "ForecastHeaderView"
    
    private let dayNameLabel = UILabel(text: nil,
                                       textColor: .white,
                                       font: .systemFont(ofSize: 30, weight: .semibold))
    
    private let dateLabel = UILabel(text: nil,
                                    textColor: .gray,
                                    textAlignment: .right,
                                    font: .futura(fontSize: 25))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func confirmHeader(list: List) {

        let dateText = list.dt_txt

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        if let dayNameTextData = dateFormatter.date(from: dateText) {
            dateFormatter.dateFormat = "EEEE"
            self.dayNameLabel.text = dateFormatter.string(from: dayNameTextData)
            dateFormatter.dateFormat = "d MMM"
            self.dateLabel.text = dateFormatter.string(from: dayNameTextData)
        }
    }
}
extension ForecastHeaderView {
    
    private func toFormUIElements() {
        
        let mainStackView = UIStackView(
            arrangedSubviews: [dayNameLabel, dateLabel],
            axis: .horizontal,
            spacing: 10,
            contentInsets: .init(top: 10, left: 0, bottom: 0, right: 0)
        )
        mainStackView.alignment = .top
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainStackView)
        mainStackView.leftAnchor(leftAnchor, 0)
        mainStackView.rightAnchor(rightAnchor, 0)
        mainStackView.bottomAnchor(bottomAnchor, 0)
        mainStackView.topAnchor(topAnchor, 0)
    }
}
