//
//  HomeViewController.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {

    private let mainView = HomeVCHomeView()
    private var presenter: HomeVCPresentable
    private let coreLocation = CLLocationManager()
    
    init() {
        self.presenter = HomeVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreLocation.delegate = self
        coreLocation.requestAlwaysAuthorization()
        coreLocation.startUpdatingLocation()
    }
}

extension HomeViewController: CLLocationManagerDelegate {
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.presenter.updateInterfaceWithLocation(manager: manager)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.presenter.updateInterfaceWithLocation(manager: manager)
    }
}

