//
//  TabBarViewController.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        
        let homeVC = HomeViewController()
        let forecastVC = ForecastViewController()
        let searchVC = SearchViewController()
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        let forecastNav = UINavigationController(rootViewController: forecastVC)
        let searchNav = UINavigationController(rootViewController: searchVC)

        let homeNavImage = UIImage(named: "homeImage")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))
        
        let homeNavSelectedImage = UIImage(named: "homeSelectedImage")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))
        
        let forecastNavImage = UIImage(named: "daysImage")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))
        
        let forecastNavSelectedImage = UIImage(named: "daysSelectedImage")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))
        
        let searchNavImage = UIImage(named: "search")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))
        
        let searchNavSelectedImage = UIImage(named: "searchfill")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))

        
        homeNavImage?.withTintColor(.white, renderingMode: .alwaysTemplate)
        homeNavSelectedImage?.withTintColor(.white)
        
        forecastNavImage?.withTintColor(.white)
        forecastNavSelectedImage?.withTintColor(.white)
        
        searchNavImage?.withTintColor(.white)
        searchNavSelectedImage?.withTintColor(.white)

        forecastNav.tabBarItem = UITabBarItem(
            title: nil,
            image: forecastNavImage,
            selectedImage: forecastNavSelectedImage
        )
        
        homeNav.tabBarItem = UITabBarItem(
            title: nil,
            image: homeNavImage,
            selectedImage: homeNavSelectedImage
        )
        
        searchNav.tabBarItem = UITabBarItem(
            title: nil,
            image: searchNavImage,
            selectedImage: searchNavSelectedImage
        )
        
        self.viewControllers = [homeNav, searchNav, forecastNav]
        setSettings()
        setUpTabbarRectangle()
    }
    
    private func setSettings() {
        
        let appereanse = UITabBarAppearance()
        appereanse.configureWithOpaqueBackground()
        appereanse.backgroundColor = .clear
        appereanse.stackedLayoutAppearance.selected.iconColor = .white
        appereanse.stackedLayoutAppearance.normal.iconColor = .white

        UITabBar.appearance().standardAppearance = appereanse
        
        let appereanse1 = UINavigationBarAppearance()
        appereanse1.configureWithOpaqueBackground()
        appereanse1.backgroundColor = .clear

        UINavigationBar.appearance().standardAppearance = appereanse1
        UINavigationBar.appearance().scrollEdgeAppearance = appereanse1
    }
    
    private func setUpTabbarRectangle() {
        
        let gradient = CAGradientLayer()
        
        let roundRect = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: 20,
                                y: -10,
                                width: tabBar.bounds.width - 40,
                                height: tabBar.bounds.height + 20),
            byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: 20, height: 20))
        
        roundRect.path = bezierPath.cgPath
        roundRect.fillColor = UIColor.rgb(r: 17, g: 20, b: 84).cgColor
        
        gradient.colors = [
            UIColor.rgb(r: 17, g: 20, b: 34).cgColor,
            UIColor.rgb(r: 10, g: 19, b: 88).cgColor,
            UIColor.rgb(r: 3, g: 5, b: 69).cgColor
        ]

        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.frame = CGRect(x: 20,
                                y: -10,
                                width: tabBar.bounds.width - 40,
                                height: tabBar.bounds.height + 20)
        gradient.cornerRadius = 20

        
        tabBar.layer.insertSublayer(roundRect, at: 0)
        tabBar.layer.insertSublayer(gradient, at: 1)
        
        tabBar.backgroundColor = .clear
        tabBar.isTranslucent = true
    }
}
