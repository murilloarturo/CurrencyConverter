//
//  HomeViewController.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit

protocol HomeViewControllerPresenter: class {
    func viewDidLoad()
}

class HomeViewController: UIViewController {
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

        presenter.viewDidLoad()
    }
    
    
}
