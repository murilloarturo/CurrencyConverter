//
//  CurrencyRate.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import Foundation
import ObjectMapper

private enum CodingKey: String {
    case base
    case date
    case rates
}

class CurrencyRateData: Mappable {
    var base: CurrencyCode
    var date: Date?
    var rates: [CurrencyRate] = []
    var primaryRates: [CurrencyRate] {
        return rates.filter{ $0.isPrimary }
    }
    var otherRates: [CurrencyRate] {
        return rates.filter{ !$0.isPrimary }
    }
    
    required init?(map: Map) {
        guard let baseString = map.JSON[CodingKey.base.rawValue] as? String,
            let baseCode = CurrencyCode(rawValue: baseString) else {
            return nil
        }
        
        self.base = baseCode
    }
    
    func mapping(map: Map) {
        base <- map[CodingKey.base.rawValue]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        date <- (map[CodingKey.date.rawValue], DateFormatterTransform(dateFormatter: dateFormatter))
        rates <- (map[CodingKey.rates.rawValue], CurrencyRatesTransformType())
    }
}

class CurrencyRate {
    var currency: CurrencyCode
    var rate: Double = 0.0
    var isPrimary: Bool {
        return currency == .unitedKingdom || currency == .europe || currency == .japan || currency == .brazil || currency == .usa
    }
    
    init(currency: CurrencyCode, rate: Double) {
        self.currency = currency
        self.rate = rate
    }
}

struct CurrencyRatesTransformType: TransformType {
    typealias Object = [CurrencyRate]
    typealias JSON = [String: Any]
    
    func transformFromJSON(_ value: Any?) -> [CurrencyRate]? {
        guard let json = value as? JSON else {
            return []
        }
        
        var data: [CurrencyRate] = []
        json.forEach { (item) in
            guard let currencyCode = CurrencyCode(rawValue: item.key),
                let rate = item.value as? Double else {
                    return
            }
            
            data.append(CurrencyRate(currency: currencyCode, rate: rate))
        }
        return data
    }
    
    func transformToJSON(_ value: [CurrencyRate]?) -> [String : Any]? {
        guard let value = value else {
            return nil
        }
        
        var json: [String: Any] = [:]
        value.forEach{ json[$0.currency.rawValue] = $0.rate }
        return json
    }
}
