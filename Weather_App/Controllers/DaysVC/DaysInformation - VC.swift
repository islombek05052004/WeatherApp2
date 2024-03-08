//
//  DaysInformationViewController.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 25/02/24.
//

import UIKit

class DaysInformationViewController: UIViewController {
    
    private let mainView = DaysInformationVCHomeView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        
    }
    
}
