//
//  CurrencyRateAPI.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

private enum URLString {
    static let api: String = "http://api.fixer.io/latest"
}

enum APIError : Error {
    case parsingError(message: String)
}

class CurrencyRateAPI {
    static func fetchRates(for currencyCode: CurrencyCode) -> Single<CurrencyRateData> {
        return Single.create(subscribe: { (single) -> Disposable in
            let params = ["base": currencyCode.rawValue]
            Alamofire.request(URLString.api, method: .get, parameters: params)
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let info):
                        guard let json = info as? [String: Any],
                            let data = CurrencyRateData(JSON: json) else {
                                single(.error(APIError.parsingError(message: LocalizedString.parsingError.localize())))
                                return
                        }
                        
                        single(.success(data))
                    case .failure(let error):
                        single(.error(error))
                    }
                })
            
            return Disposables.create()
        })
    }
}
