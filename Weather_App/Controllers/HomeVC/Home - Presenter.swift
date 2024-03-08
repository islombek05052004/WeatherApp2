//
//  Home - Presenter.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit
import CoreLocation

protocol HomeVCPresentable: AnyObject {
    
    var view: HomeVCHomeView! { get set }
    
    var viewController: HomeViewController! { get set }
    
    func searchTapped()
    
    func updateInterfaceWithLocation(manager: CLLocationManager)
}

final class HomeVCPresenter: HomeVCPresentable {
    
    
    weak var view: HomeVCHomeView!
    
    weak var viewController: HomeViewController!
    
    func searchTapped() {
        
        let alertVC = UIAlertController(
            title: "Enter City name",
            message: nil,
            preferredStyle: .alert
        )
        alertVC.addTextField()
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let searchAction = UIAlertAction(title: "Search", style: .default) { UIAlertAction in
            
            if let hasText = alertVC.textFields?.first?.text, hasText != "" {
                
                let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(hasText)&appid=56797753d5da99969b3f04af2ca3f5e1"

                guard let url = URL(string: urlString) else { return }
                
                NetworkManager.shared.fetchData(with: url) { (result: Result<WeatherData, Error>) in
                    switch result {
                        
                    case .success(let object):
                        
                        if let readyData = WeatherReadyData(weatherData: object) {
                            self.view.updateInterface(weatherData: readyData)
                        }
                        
                    case .failure(_):
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.showActivityIndicator(succesfull: false)
                        }
                    }
                }
            }
        }
        alertVC.addAction(searchAction)
        alertVC.addAction(cancelAction)
        self.viewController.present(with: alertVC)
    }
    
    func updateInterfaceWithLocation(manager: CLLocationManager) {
        
        guard let coordinate = manager.location?.coordinate else { return }
        
        let lat = coordinate.latitude
        let long = coordinate.longitude
        
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(long)&appid=56797753d5da99969b3f04af2ca3f5e1"
        
        guard let url = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchData(with: url) { (result: Result<WeatherData, Error>) in
            switch result {
                
            case .success(let object):
                
                if let readyData = WeatherReadyData(weatherData: object) {
                    self.view.updateInterface(weatherData: readyData)
                }
                
            case .failure(_):
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.showActivityIndicator(succesfull: false)
                }
            }
        }
    }
    
    func showActivityIndicator(succesfull: Bool) {
        
        let alertVC = UIAlertController(
            title: "error name of city",
            message: nil,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        
        alertVC.addAction(okAction)
        
        if succesfull == false {
            viewController.present(with: alertVC)
            return
        }
    }
}
    

