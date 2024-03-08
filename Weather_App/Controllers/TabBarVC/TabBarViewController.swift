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
        let daysVC = DaysInformationViewController()
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        let daysNav = UINavigationController(rootViewController: daysVC)
        
        let homeNavImage = UIImage(named: "homeImage")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))
        homeNavImage?.withTintColor(.white, renderingMode: .alwaysTemplate)
        
        let homeNavSelectedImage = UIImage(named: "homeSelectedImage")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))
        homeNavSelectedImage?.withTintColor(.white)
        
        homeNav.tabBarItem = UITabBarItem(
            title: nil,
            image: homeNavImage,
            selectedImage: homeNavSelectedImage
        )
        
        let daysNavImage = UIImage(named: "daysImage")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))
        daysNavImage?.withTintColor(.white)
        
        let daysNavSelectedImage = UIImage(named: "daysSelectedImage")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))
        daysNavSelectedImage?.withTintColor(.white)
        
        daysNav.tabBarItem = UITabBarItem(
            title: nil,
            image: daysNavImage,
            selectedImage: daysNavSelectedImage
        )
        
        self.viewControllers = [homeNav, daysNav]
        setSettings()
    }
    
    private func setSettings() {
        
        let appereanse = UITabBarAppearance()
        appereanse.configureWithOpaqueBackground()
        appereanse.backgroundColor = .clear
        appereanse.stackedLayoutAppearance.selected.iconColor = .white
        appereanse.stackedLayoutAppearance.normal.iconColor = .white

        UITabBar.appearance().standardAppearance = appereanse
        UITabBar.appearance().scrollEdgeAppearance = appereanse
        
        let appereanse1 = UINavigationBarAppearance()
        appereanse1.configureWithOpaqueBackground()
        appereanse1.backgroundColor = .clear

        UINavigationBar.appearance().standardAppearance = appereanse1
        UINavigationBar.appearance().scrollEdgeAppearance = appereanse1
    }
}
