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
        
    func updateInterfaceWithLocation(manager: CLLocationManager)
}

final class HomeVCPresenter: HomeVCPresentable {
    
    weak var view: HomeVCHomeView!
    
    weak var viewController: HomeViewController!
    
    func updateInterfaceWithLocation(manager: CLLocationManager) {
        
        guard let coordinate = manager.location?.coordinate else { showNotFindAlert(); return }
        
        let lat = coordinate.latitude
        let long = coordinate.longitude
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=56797753d5da99969b3f04af2ca3f5e1"
        
        guard let url = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchData(with: url) { (result: Result<WeatherData, Error>) in
            switch result {
                
            case .success(let object):
                
                if let readyData = ReadyWeatherData(weatherData: object) {
                    self.view.updateInterface(weatherData: readyData)
                }
                
            case .failure(_):
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.showNotFindAlert()
                }
            }
        }
    }

    private func showNotFindAlert() {
        
        let alertVC = UIAlertController(
            title: "We could not find information for your address. Please restart the app.",
            message: nil,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertVC.addAction(okAction)
        viewController.present(with: alertVC)
    }
}
