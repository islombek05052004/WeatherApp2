//
//  ForecastViewController.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit
import CoreLocation

class ForecastViewController: UIViewController {
    
    private var presenter: ForecastVCPresentable
    private let mainView = ForecastVCHomeView()
    private let locationManager = CLLocationManager()
    
    init() {
        self.presenter = ForecastVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
        setTitleToNavigation()
    }
    
    override func viewDidLoad() {
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        mainView.forecastCollectionView.delegate = self
        mainView.forecastCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.alwaysUpdateInterface(manager: locationManager)
    }
    
}

extension ForecastViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter.numberOfSections(in: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {        
        presenter.setHeaderView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
    
}

extension ForecastViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        presenter.alwaysUpdateInterface(manager: manager)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        presenter.alwaysUpdateInterface(manager: manager)
    }
}

extension ForecastViewController {
    
    private func setTitleToNavigation() {
        
        let countryForecastLabel = UILabel(text: "Forecast report",
                                           textColor: .white,
                                           textAlignment: .center,
                                           font: .systemFont(ofSize: 25, weight: .semibold))
        
        self.navigationItem.titleView = countryForecastLabel
    }
}
