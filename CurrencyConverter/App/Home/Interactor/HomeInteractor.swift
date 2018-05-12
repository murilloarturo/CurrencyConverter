//
//  HomeInteractor.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import Foundation
import RxSwift

class HomeInteractor {
    func currencyRates(for currencyCode: CurrencyCode) -> Single<CurrencyRateData> {
        return CurrencyRateAPI.fetchRates(for: currencyCode)
    }
}
