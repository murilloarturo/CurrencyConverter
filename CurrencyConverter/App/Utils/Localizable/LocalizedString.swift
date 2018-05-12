//
//  LocalizedString.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import Foundation

enum LocalizedString: String {
    case parsingError
    case home
    case others
    case cancel
    case done
    case selectCurrency
    case australia
    case bulgaria
    case brazil
    case canada
    case switzerland
    case china
    case czechRepublic
    case denmark
    case europe
    case unitedKingdom
    case hongKong
    case croatia
    case hungary
    case indonesia
    case israel
    case india
    case iceland
    case japan
    case southKorea
    case mexico
    case malaysia
    case norway
    case newZealand
    case philippine
    case poland
    case romania
    case rusia
    case sweden
    case singapure
    case thailand
    case turkey
    case usa
    case southAfrica
    
    func localize() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
