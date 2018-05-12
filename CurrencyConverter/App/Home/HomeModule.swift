//
//  HomeModule.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit

class HomeModule {
    private let presenter: HomePresenter
    private let router: HomeRouter
    
    init() {
        let interactor = HomeInteractor()
        router = HomeRouter()
        presenter = HomePresenter(interactor: interactor, router: router)
    }
    
    func initalizeApplication(with window: UIWindow?) {
        router.setupApplicationWindow(window)
    }
}
