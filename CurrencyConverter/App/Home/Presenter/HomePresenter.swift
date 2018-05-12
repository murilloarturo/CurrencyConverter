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
    private weak var dataSource: HomeDataSource?
    
    init(interactor: HomeInteractor, router: HomeRouter) {
        self.interactor = interactor
        self.router = router
        
        router.showHome(with: self)
    }
}

extension HomePresenter: HomeViewControllerPresenter {
    func viewDidLoad(dataSource: HomeDataSource) {
        self.dataSource = dataSource
        dataSource.currentCurrency
            .asObservable()
            .subscribe(onNext: { [weak self] (currency) in
                self?.updateCurrencyRates(with: currency)
            })
            .disposed(by: disposeBag)
    }
    
    private func updateCurrencyRates(with currencyCode: CurrencyCode) {
        interactor.currencyRates(for: currencyCode)
            .subscribe(onSuccess: { [weak self] (data) in
                self?.dataSource?.data = data
            }) { [weak self] (error) in
                self?.router.showAlert(with: error.localizedDescription)
            }
            .disposed(by: disposeBag)
    }
}
