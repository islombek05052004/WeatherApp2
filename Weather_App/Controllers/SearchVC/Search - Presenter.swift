//
//  Serach - Presenter.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 12/03/24.
//

import UIKit

protocol SearchVCPresentable: AnyObject {
    
    var view: SearchVCHomeView! { get set }
    var viewController: SearchViewController! { get set }
    
    func textFieldShouldReturn(_ textField: UITextField, completion: @escaping(ReadyWeatherData?) -> ())
    func showAlertVC(with title: String)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
}

final class SearchVCPresenter: SearchVCPresentable {
    
    var view: SearchVCHomeView!
    var viewController: SearchViewController!
    
    private var weatherData: ReadyWeatherData? = nil
    
    func textFieldShouldReturn(_ textField: UITextField, completion: @escaping(ReadyWeatherData?) -> ()) {

        if let cityName = textField.text, cityName != "" {
         
            let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=56797753d5da99969b3f04af2ca3f5e1"
            
            guard let url = URL(string: urlString) else { return }
            
            NetworkManager.shared.fetchData(with: url) { (result: Result<WeatherData, Error>) in
                                
                switch result {

                case .success(let data):
                    if let readyWeatherData = ReadyWeatherData(weatherData: data) {
                        self.weatherData = readyWeatherData
                        completion(readyWeatherData)
                    }
                case .failure(_):
                    completion(nil)
                }
            }
        }
    }
    
    func showAlertVC(with title: String) {
        
        let alertVC = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertVC.addAction(okAction)
        viewController.present(with: alertVC)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchTableCell.identifier,
            for: indexPath
        ) as? SearchTableCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        if let weatherData = weatherData {
            cell.confirmCell(with: weatherData)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (weatherData != nil) ? 1 : 0
    }
}


