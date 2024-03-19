//
//  ForecastVC - Presenter.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit
import CoreLocation

protocol ForecastVCPresentable: AnyObject {
    
    var view: ForecastVCHomeView! { get set }
    var viewController: ForecastViewController! { get set }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    func numberOfItemsInSection(section: Int) -> Int
    func alwaysUpdateInterface(manager: CLLocationManager)
    func fetchDataWith(manager: CLLocationManager, completion: @escaping(ForecastData?) -> Void)
    func setHeaderView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
}

final class ForecastVCPresenter: ForecastVCPresentable {
    
    var view: ForecastVCHomeView!
    var viewController: ForecastViewController!
    
    private var forecastData: ForecastData? = nil
    private var listArr: [[List]] = []
    
    func fetchDataWith(manager: CLLocationManager, completion: @escaping (ForecastData?) -> Void) {
        
        guard let coordinate = manager.location?.coordinate else { return }
        
        let lat = coordinate.latitude
        let long = coordinate.longitude
        
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(long)&appid=56797753d5da99969b3f04af2ca3f5e1"
        
        guard let url = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchData(with: url) { (result: Result<ForecastData, Error>) in
            switch result {
                
            case .success(let object):
                
                completion(object)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastTableCell.identifier, for: indexPath) as? ForecastTableCell else { return UICollectionViewCell() }
        
        if listArr.count != 0 {
            
            let sectionData = listArr[indexPath.section]
            let sectionItem = sectionData[indexPath.row]
            if let forecastData = ForecastReadyData(list: sectionItem) {
                cell.confirmCell(with: forecastData)
            }
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        listArr.count
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        listArr[section].count
    }
    
    func alwaysUpdateInterface(manager: CLLocationManager) {
        fetchDataWith(manager: manager) { forecastData in
            if let forecastData = forecastData {
                DispatchQueue.main.async {
                    self.forecastData = forecastData
                    self.listArr = self.confirmListArr(data: forecastData)
                    self.view.forecastCollectionView.reloadData()
                }
            }
        }
    }
    
    func setHeaderView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ForecastHeaderView.identifier, for: indexPath) as? ForecastHeaderView else { return UICollectionReusableView() }
            
            if listArr.count != 0 {

                headerView.confirmHeader(list: listArr[indexPath.section][0])
            }
            return headerView
        }
        return UICollectionReusableView()
    }
    
    private func confirmListArr(data: ForecastData) -> [[List]] {
        
        var listArr = [[List]]()
        var currentindex = 0
        for (index, item) in data.list.enumerated() {
            
            if index < data.list.count - 1 {
                
                if getDateDay(day: item.dt_txt) != getDateDay(day: data.list[index + 1].dt_txt) {
                    
                    var arr = [List]()
                    for indexInt in currentindex...index {
                        arr.append(data.list[indexInt])
                    }
                    listArr.append(arr)
                    currentindex = index + 1
                }
            }
        }
        
        return listArr
    }
    
    private func getDateDay(day: String) -> String {
        
        var dayString = ""
        for item in day {
            dayString += "\(item)"
            
            if dayString.count == 10 { break }
        }
        return dayString
    }
}
