//
//  HomeViewController.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit

protocol HomeViewControllerPresenter: class {
    func viewDidLoad(tableView: UITableView)
}

class HomeViewController: UIViewController {
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var headerView: UIView! {
        didSet {
            headerView.layer.shadowOffset = CGSize(width: 0, height: 1.5)
            headerView.layer.shadowRadius = 5.0
            headerView.layer.shadowOpacity = 0.2
            headerView.layer.masksToBounds = false
        }
    }
    
    private let presenter: HomeViewControllerPresenter
    
    init(presenter: HomeViewControllerPresenter) {
        self.presenter = presenter
        
        super.init(nibName: String(describing: HomeViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad(tableView: tableView)
    }
}

private extension HomeViewController {
    func setupUI() {
        title = LocalizedString.home.localize()
        
        searchTextField.delegate = self
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil else {
            return false
        }
        
        return true
    }
}
