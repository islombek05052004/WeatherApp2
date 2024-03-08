//
//  UIViewController+.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit

extension UIViewController {
    
    func pushVC(with vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func present(
        with vc: UIViewController,
        modalPresentationStyle: UIModalPresentationStyle? = nil,
        modalTransitionStyle: UIModalTransitionStyle? = nil
    ) {
        
        if let modalPresentationStyle = modalPresentationStyle {
            vc.modalPresentationStyle = modalPresentationStyle
        }
        if let modalTransitionStyle = modalTransitionStyle {
            vc.modalTransitionStyle = modalTransitionStyle
        }
        self.present(vc, animated: true)
    }
    
    func setUpBackButtonToNavigation() {
        
        let backButtonImage = UIImage(
            named: "back")?.withRenderingMode(.alwaysOriginal).resizeImage(
                targetSize: CGSize(width: 30, height: 30)
            )
        
        let backButton = UIBarButtonItem(
            image: backButtonImage,
            style: .done,
            target: self,
            action: #selector(navigationBackButtonTapped)
        )
        
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func navigationBackButtonTapped() {
        popVC()
    }
}
