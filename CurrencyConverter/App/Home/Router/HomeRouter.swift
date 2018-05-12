//
//  HomeRouter.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit

class HomeRouter {
    private let navigation: UINavigationController
    
    init() {
        self.navigation = UINavigationController()
    }
    
    func showHome(with presenter: HomePresenter) {
        let viewController = HomeViewController(presenter: presenter)
        navigation.viewControllers = [viewController]
    }
    
    func setupApplicationWindow(_ window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        navigation.present(alert, animated: true, completion: nil)
    }
}
