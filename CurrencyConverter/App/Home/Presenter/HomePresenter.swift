//
//  HomePresenter.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import Foundation
import RxSwift

class HomePresenter {
    private let interactor: HomeInteractor
    private let router: HomeRouter
    private let disposeBag = DisposeBag()
    
    init(interactor: HomeInteractor, router: HomeRouter) {
        self.interactor = interactor
        self.router = router
        
        router.showHome(with: self)
    }
}

extension HomePresenter: HomeViewControllerPresenter {
    func viewDidLoad() {
        interactor.currencyRates(for: .usa)
            .subscribe(onSuccess: { [weak self] (data) in
                self?.parseData(data: data)
            }) { [weak self] (error) in
                
            }
            .disposed(by: disposeBag)
        
    }
    
    func parseData(data: CurrencyRateData) {
        
    }
}
