//
//  Home - UI.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit

final class HomeVCHomeView: UIView {
    
    private let mainScrollView = UIScrollView()
    private let mainStackView = UIStackView(
        arrangedSubviews: [],
        axis: .vertical,
        spacing: 40,
        contentInsets: .init(top: 0, left: 10, bottom: 40, right: 10)
    )
    
    private let cityNameLabel = UILabel(text: "*****",
                                        font: .systemFont(ofSize: 30, weight: .semibold))
    
    private let dayLabel = UILabel(text: "******")
    
    private let weatherTypeImageView = UIImageView(image: UIImage(named: "sun"),
                                                   contentMode: .scaleAspectFit)
    
    private let temperatureLabel = UILabel(text: "***",
                                           textAlignment: .center,
                                           font: .systemFont(ofSize: 75, weight: .regular))
    
    private let feelsLikeLabel = UILabel(text: "Feel like: ***",
                                         textAlignment: .center,
                                         font: .systemFont(ofSize: 17, weight: .semibold))
    
    private let atributeWeatherLabel = UILabel(text: "***",
                                               textAlignment: .center,
                                               font: .systemFont(ofSize: 30, weight: .regular))
    
    private let minMaxTemperatureLabel = UILabel(text: "Min | Max",
                                                 textColor: .gray,
                                                 font: .systemFont(ofSize: 17, weight: .regular))
    
    private let minMaxLabel = UILabel(text: "*****",
                                      font: .systemFont(ofSize: 19, weight: .regular))
    
    private let pressureTitleLabel = UILabel(text: "Pressure",
                                             textColor: .gray,
                                             font: .systemFont(ofSize: 17, weight: .regular))
    
    private let pressureLabel = UILabel(text: "*****",
                                        font: .systemFont(ofSize: 19, weight: .regular))
    
    private let humidityTitleLabel = UILabel(text: "Humidity",
                                             textColor: .gray,
                                             font: .systemFont(ofSize: 17, weight: .regular))

    private let humidityLabel = UILabel(text: "*****",
                                        font: .systemFont(ofSize: 19, weight: .regular))

    private let windTitleLabel = UILabel(text: "Wind",
                                         textColor: .gray,
                                         font: .systemFont(ofSize: 17, weight: .regular))

    private let windLabel = UILabel(text: "*****",
                                    font: .systemFont(ofSize: 19, weight: .regular))

    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeVCHomeView {
    
    private func toFormUIElements() {
        setGradient()
        toFormMainScrollStackView()
        toFormFirstMainInformationStackView()
        toFormSecondMainInformationStackView()
    }
    
    private func toFormMainScrollStackView() {
        
        mainScrollView.showsVerticalScrollIndicator = false
        
        addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        mainScrollView.leftAnchor(leftAnchor, 0)
        mainScrollView.topAnchor(topAnchor, 0)
        mainScrollView.bottomAnchor(safeAreaLayoutGuide.bottomAnchor, 0)
        mainScrollView.widthAnchor(width: UIScreen.main.bounds.width)
        
        mainStackView.leftAnchor(mainScrollView.leftAnchor, 0)
        mainStackView.widthAnchor(width: UIScreen.main.bounds.width)
        mainStackView.topAnchor(mainScrollView.topAnchor, 0)
        mainStackView.bottomAnchor(mainScrollView.bottomAnchor, 0)
    }
    
    private func toFormFirstMainInformationStackView() {
        
        let cityNameDayStackView = UIStackView(
            arrangedSubviews: [cityNameLabel, dayLabel],
            axis: .vertical,
            spacing: 5
        )
        cityNameDayStackView.alignment = .center
        
        let temperatureStackView = UIStackView(
            arrangedSubviews: [temperatureLabel, feelsLikeLabel],
            axis: .vertical,
            spacing: 5
        )
        temperatureStackView.alignment = .fill
        temperatureStackView.distribution = .fill
        
        let temperatureAtributeStackView = UIStackView(
            arrangedSubviews: [temperatureStackView, atributeWeatherLabel],
            axis: .horizontal,
            spacing: 20
        )
        
        temperatureAtributeStackView.distribution = .fillEqually
        temperatureAtributeStackView.translatesAutoresizingMaskIntoConstraints = false
        temperatureAtributeStackView.widthAnchor(width: UIScreen.main.bounds.width - 40)
        
        let firstMainInformationStackView = UIStackView(
            arrangedSubviews: [cityNameDayStackView, weatherTypeImageView, temperatureAtributeStackView],
            axis: .vertical,
            spacing: 30
        )
        firstMainInformationStackView.alignment = .center
        firstMainInformationStackView.distribution = .fill
        
        mainStackView.addArrangedSubview(firstMainInformationStackView)
        
        temperatureLabel.setShadow(5, 5, UIColor.gray.cgColor, 1, 6)
        
        weatherTypeImageView.setShadow(5, 10, UIColor.white.cgColor, 0.7, 10)
        weatherTypeImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherTypeImageView.widhtHeight(Paddings.deviceWidth * 0.6,
                                         Paddings.deviceWidth * 0.6)
        
        atributeWeatherLabel.numberOfLines = 0
    }
    
    private func toFormSecondMainInformationStackView() {
        
        let minMaxStackView = UIStackView(
            arrangedSubviews: [minMaxTemperatureLabel, minMaxLabel],
            axis: .vertical,
            spacing: 5
        )
        minMaxStackView.alignment = .center
        
        let pressureStackView = UIStackView(
            arrangedSubviews: [pressureTitleLabel, pressureLabel],
            axis: .vertical,
            spacing: 5
        )
        pressureStackView.alignment = .center
        
        let humidityStackView = UIStackView(
            arrangedSubviews: [humidityTitleLabel, humidityLabel],
            axis: .vertical,
            spacing: 5
        )
        humidityStackView.alignment = .center
        
        let windStackView = UIStackView(
            arrangedSubviews: [windTitleLabel, windLabel],
            axis: .vertical,
            spacing: 5
        )
        windStackView.alignment = .center
        
        let firstHorizontalStackView = UIStackView(
            arrangedSubviews: [minMaxStackView, pressureStackView],
            axis: .horizontal,
            spacing: 10
        )
        firstHorizontalStackView.distribution = .fillEqually
        
        let secondHorizontalStackView = UIStackView(
            arrangedSubviews: [humidityStackView, windStackView],
            axis: .horizontal,
            spacing: 10
        )
        secondHorizontalStackView.distribution = .fillEqually

        let currentMainStackView = UIStackView(
            arrangedSubviews: [firstHorizontalStackView, secondHorizontalStackView],
            axis: .vertical,
            spacing: 20,
            contentInsets: .init(top: 20, left: 20, bottom: 20, right: 20)
        )
        
        mainStackView.addArrangedSubview(currentMainStackView)
        
        currentMainStackView.backgroundColor = .rgb(r: 14, g: 34, b: 90)
        currentMainStackView.layer.cornerRadius = 20
        
    }
    
    func updateInterface(weatherData: ReadyWeatherData) {
        
        let currentDate = Date()
        let nameFormatter = DateFormatter()
        nameFormatter.dateFormat = "MMM d, yyyy"
        
        let day = nameFormatter.string(from: currentDate)
        
        DispatchQueue.main.async {
                        
            self.temperatureLabel.text = weatherData.temperatureString
            self.minMaxLabel.text = weatherData.minMaxTemperatureString
            self.pressureLabel.text = weatherData.pressureString
            self.humidityLabel.text = weatherData.himidityString
            self.windLabel.text = weatherData.speedString
            self.atributeWeatherLabel.text = weatherData.description
            self.feelsLikeLabel.text = weatherData.feelsLikeTemperaturaString
            self.dayLabel.text = day
            self.cityNameLabel.text = weatherData.cityName
            self.weatherTypeImageView.image = UIImage(named: weatherData.weatherIconImageName)
        }
    }
}
