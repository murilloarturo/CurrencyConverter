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
    var rate: Float = 0.0
    
    init(currency: CurrencyCode, rate: Float) {
        self.currency = currency
        self.rate = rate
    }
}

enum CurrencyCode: String {
    case australia = "AUD"
    case bulgaria = "BGN"
    case brazil = "BRL"
    case canada = "CAD"
    case switzerland = "CHF"
    case china = "CNY"
    case czechRepublic = "CZK"
    case denmark = "DKK"
    case europe = "EUR"
    case unitedKingdom = "GBP"
    case hongKong = "HKD"
    case croatia = "HRK"
    case hungary = "HUF"
    case indonesia = "IDR"
    case israel = "ILS"
    case india = "INR"
    case iceland = "ISK"
    case japan = "JPY"
    case southKorea = "KRW"
    case mexico = "MXN"
    case malaysia = "MYR"
    case norway = "NOK"
    case newZealand = "NZD"
    case philippine = "PHP"
    case poland = "PLN"
    case romania = "RON"
    case rusia = "RUB"
    case sweden = "SEK"
    case singapure = "SGD"
    case thailand = "THB"
    case turkey = "TRY"
    case usa = "USD"
    case southAfrica = "ZAR"
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
                let rate = item.value as? Float else {
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
