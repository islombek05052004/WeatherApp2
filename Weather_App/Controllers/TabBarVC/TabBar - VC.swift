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
        
        let daysNavSelectedImage = UIImage(named: "daysSelectedImage")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))
        
        let homeNavSelectedImage = UIImage(named: "homeSelectedImage")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))
        
        let daysNavImage = UIImage(named: "daysImage")?.resizeImage(
            targetSize: CGSize(width: 30, height: 30))
        
        homeNavImage?.withTintColor(.white, renderingMode: .alwaysTemplate)
        
        homeNavSelectedImage?.withTintColor(.white)
        
        daysNavImage?.withTintColor(.white)
        
        daysNavSelectedImage?.withTintColor(.white)
        
        daysNav.tabBarItem = UITabBarItem(
            title: nil,
            image: daysNavImage,
            selectedImage: daysNavSelectedImage
        )
        
        homeNav.tabBarItem = UITabBarItem(
            title: nil,
            image: homeNavImage,
            selectedImage: homeNavSelectedImage
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
    
    private func setUpTabbarRectangle() {
        
        
        let roundRect = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(x: 0,
                                y: tabBar.bounds.height - 60,
                                width: tabBar.bounds.width,
                                height: tabBar.bounds.height + 60),
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 20, height: 20))
        
        roundRect.path = bezierPath.cgPath
        roundRect.fillColor = UIColor.rgb(r: <#T##CGFloat#>, g: <#T##CGFloat#>, b: <#T##CGFloat#>)
        
        tabBar.layer.insertSublayer(roundRect, at: 0)
        tabBar.backgroundColor = .clear
        tabBar.isTranslucent = true
    }
}
