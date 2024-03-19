//
//  DaysInformation - UI.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit

final class ForecastVCHomeView: UIView {
    
    private let countryForecastLabel = UILabel(text: "Forecast",
                                               textColor: .white,
                                               textAlignment: .center,
                                               font: .systemFont(ofSize: 30, weight: .semibold))
    
    private let forecastTableView: UITableView = {
       
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
        
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
