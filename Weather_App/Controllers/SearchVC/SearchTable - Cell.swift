//
//  SearchTable - Cell.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 13/03/24.
//

import UIKit

class SearchTableCell: UITableViewCell {
    
    static let identifier = "SearchTableCell"
    
    private let cityNameLabel = UILabel(text: "nil", textColor: .white, font: .futura(fontSize: 25))
    private let descLabel = UILabel(text: "nil", textColor: .white, font: .futura(fontSize: 20))
    private let imageViewCell = UIImageView(image: nil, contentMode: .scaleAspectFit)
    private let tempLabel = UILabel(text: "nil", textColor: .white, font: .futura(fontSize: 40))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SearchTableCell {
    
    private func toFormUIElements() {
                
        let infoStackView = UIStackView(
            arrangedSubviews: [cityNameLabel, descLabel],
            axis: .vertical,
            spacing: 5
        )
        
        let mainStackView = UIStackView(
            arrangedSubviews: [imageViewCell, infoStackView, tempLabel],
            axis: .horizontal,
            spacing: 10,
            contentInsets: .init(top: 10, left: 20, bottom: 10, right: 10)
        )
             
        infoStackView.alignment = .center
        
        imageViewCell.backgroundColor = .clear
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        imageViewCell.widhtHeight(60, 60)
        
        mainStackView.layer.cornerRadius = 20
        mainStackView.backgroundColor = .rgb(r: 62, g: 134, b: 226)
        mainStackView.alignment = .center
        mainStackView.heightAnchor(height: 100)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
        
        mainStackView.leftAnchor(leftAnchor, 20)
        mainStackView.rightAnchor(rightAnchor, -20)
        mainStackView.topAnchor(topAnchor, 10)
        mainStackView.bottomAnchor(bottomAnchor, -10)
    }
    
    func confirmCell(with data: ReadyWeatherData) {
        
        self.imageViewCell.image = UIImage(named: data.weatherIconImageName)
        self.cityNameLabel.text = data.cityName
        self.tempLabel.text = data.temperatureString
        self.descLabel.text = data.description
    }
}
