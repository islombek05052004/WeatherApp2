//
//  Forecast - TableCell.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 14/03/24.
//

import UIKit

class ForecastTableCell: UICollectionViewCell {
    
    static let identifier = "ForecastTableCell"
    
    private let imageView = UIImageView(image: UIImage(named: "sun"), contentMode: .scaleAspectFit)
    private let dateLabel = UILabel(text: "6 March", textColor: .white, font: .futura(fontSize: 20))
    private let tempLabel = UILabel(text: "21˚", textColor: .white, font: .futura(fontSize: 30))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        layer.cornerRadius = 30
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ForecastTableCell {
    
    private func toFormUIElements() {
        
        self.backgroundColor = .rgb(r: 62, g: 134, b: 226)

        let infoStackView = UIStackView(
            arrangedSubviews: [dateLabel, tempLabel],
            axis: .vertical,
            spacing: 5
        )
        infoStackView.alignment = .center
        
        let mainStackView = UIStackView(
            arrangedSubviews: [imageView, dateLabel, tempLabel],
            axis: .vertical,
            spacing: 10,
            contentInsets: .init(top: 0, left: 10, bottom: 10, right: 10)
        )
        mainStackView.alignment = .center
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widhtHeight(80, 80)
        
        addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leftAnchor(leftAnchor, 0)
        mainStackView.rightAnchor(rightAnchor, 0)
        mainStackView.bottomAnchor(bottomAnchor, 0)
        mainStackView.topAnchor(topAnchor, -40)
    }
    
    func confirmCell(with data: ForecastReadyData) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let dayNameTextData = dateFormatter.date(from: data.date) {
            dateFormatter.dateFormat = "HH:mm"
            self.dateLabel.text = dateFormatter.string(from: dayNameTextData)
        }
        
        self.imageView.image = UIImage(named: data.weatherIconImageName)
        self.tempLabel.text = data.temperatureString
        self.setShadow(3, 3, UIColor.systemBlue.cgColor, 0.8, 3)
//        self.imageView.setShadow(1, 1, UIColor.white.cgColor, 0.8, 4)
    }
}
