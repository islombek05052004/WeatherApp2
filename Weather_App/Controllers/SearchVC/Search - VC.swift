//
//  SearchViewController.swift
//  Weather_App
//
//  Created by Abdurazzoqov Islombek on 12/03/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let mainView = SearchVCHomeView()
    private var presenter: SearchVCPresentable
    
    init() {
        self.presenter = SearchVCPresenter()
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
        
        setDelegates()
    }
    
    private func setDelegates() {
        
        mainView.searchTextField.delegate = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
}

extension SearchViewController: UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.tableView(tableView, cellForRowAt: indexPath)
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                    
        presenter.textFieldShouldReturn(textField) { weatherData in
                        
            if weatherData != nil {
                DispatchQueue.main.async {
                    self.mainView.tableView.reloadData()
                }
            } else {
                DispatchQueue.main.async {
                    self.presenter.showAlertVC(with: "no found")
                }
            }
        }
        textField.endEditing(true)
        return true
    }
}
