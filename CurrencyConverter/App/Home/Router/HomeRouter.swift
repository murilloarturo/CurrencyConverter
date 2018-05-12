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
        let viewController = HomeViewController()
        navigation.viewControllers = [viewController]
    }
    
    func setupApplicationWindow(_ window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
