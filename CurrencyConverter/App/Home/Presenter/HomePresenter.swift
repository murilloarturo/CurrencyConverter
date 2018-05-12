//
//  HomePresenter.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import Foundation

class HomePresenter {
    private let interactor: HomeInteractor
    private let router: HomeRouter
    
    init(interactor: HomeInteractor, router: HomeRouter) {
        self.interactor = interactor
        self.router = router
        
        router.showHome(with: self)
    }
}
