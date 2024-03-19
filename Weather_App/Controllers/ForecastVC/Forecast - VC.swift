//
//  DaysInformationViewController.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit
import CoreLocation

class ForecastViewController: UIViewController {
    
    private let mainView = ForecastVCHomeView()
    private let locationManager = CLLocationManager()

    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        
        locationManager.delegate = self
        
        
        
    }
}

extension ForecastViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
    }
    
}
