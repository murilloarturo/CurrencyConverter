//
//  CurrencyCode.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit

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

extension CurrencyCode {
    var image: UIImage? {
        switch self {
        case .australia:
            return #imageLiteral(resourceName: "newZealand")
        case .bulgaria:
            return #imageLiteral(resourceName: "bulgaria")
        case .brazil:
            return #imageLiteral(resourceName: "brazil")
        case .canada:
            return #imageLiteral(resourceName: "canada")
        case .switzerland:
            return #imageLiteral(resourceName: "switzerland")
        case .denmark:
            return #imageLiteral(resourceName: "denmark")
        case .europe:
            return #imageLiteral(resourceName: "europe")
        case .unitedKingdom:
            return #imageLiteral(resourceName: "unitedKingdom")
        case .hongKong:
            return #imageLiteral(resourceName: "hongKong")
        case .croatia:
            return #imageLiteral(resourceName: "croatia")
        case .hungary:
            return #imageLiteral(resourceName: "hungary")
        case .indonesia:
            return #imageLiteral(resourceName: "indonesia")
        case .israel:
            return #imageLiteral(resourceName: "israel")
        case .india:
            return #imageLiteral(resourceName: "india")
        case .iceland:
            return #imageLiteral(resourceName: "iceland")
        case .japan:
            return #imageLiteral(resourceName: "japan")
        case .southKorea:
            return #imageLiteral(resourceName: "southKorea")
        case .mexico:
            return #imageLiteral(resourceName: "mexico")
        case .malaysia:
            return #imageLiteral(resourceName: "malaysia")
        case .norway:
            return #imageLiteral(resourceName: "norway")
        case .newZealand:
            return #imageLiteral(resourceName: "newZealand")
        case .philippine:
            return #imageLiteral(resourceName: "philippine")
        case .poland:
            return #imageLiteral(resourceName: "polan")
        case .romania:
            return #imageLiteral(resourceName: "romania")
        case .rusia:
            return #imageLiteral(resourceName: "rusia")
        case .sweden:
            return #imageLiteral(resourceName: "sweden")
        case .singapure:
            return #imageLiteral(resourceName: "singapure")
        case .thailand:
            return #imageLiteral(resourceName: "thailand")
        case .turkey:
            return #imageLiteral(resourceName: "turkey")
        case .usa:
            return #imageLiteral(resourceName: "usa")
        case .southAfrica:
            return #imageLiteral(resourceName: "southAfrica")
        case .china:
            return #imageLiteral(resourceName: "china")
        case .czechRepublic:
            return #imageLiteral(resourceName: "czechRepublic")
        }
    }
    
    var description: String {
        switch self {
        case .australia:
            return LocalizedString.australia.localize()
        case .bulgaria:
            return LocalizedString.bulgaria.localize()
        case .brazil:
            return LocalizedString.brazil.localize()
        case .canada:
            return LocalizedString.canada.localize()
        case .switzerland:
            return LocalizedString.switzerland.localize()
        case .denmark:
            return LocalizedString.denmark.localize()
        case .europe:
            return LocalizedString.europe.localize()
        case .unitedKingdom:
            return LocalizedString.unitedKingdom.localize()
        case .hongKong:
            return LocalizedString.hongKong.localize()
        case .croatia:
            return LocalizedString.croatia.localize()
        case .hungary:
            return LocalizedString.hungary.localize()
        case .indonesia:
            return LocalizedString.indonesia.localize()
        case .israel:
            return LocalizedString.israel.localize()
        case .india:
            return LocalizedString.india.localize()
        case .iceland:
            return LocalizedString.iceland.localize()
        case .japan:
            return LocalizedString.japan.localize()
        case .southKorea:
            return LocalizedString.southKorea.localize()
        case .mexico:
            return LocalizedString.mexico.localize()
        case .malaysia:
            return LocalizedString.malaysia.localize()
        case .norway:
            return LocalizedString.norway.localize()
        case .newZealand:
            return LocalizedString.newZealand.localize()
        case .philippine:
            return LocalizedString.philippine.localize()
        case .poland:
            return LocalizedString.poland.localize()
        case .romania:
            return LocalizedString.romania.localize()
        case .rusia:
            return LocalizedString.rusia.localize()
        case .sweden:
            return LocalizedString.sweden.localize()
        case .singapure:
            return LocalizedString.singapure.localize()
        case .thailand:
            return LocalizedString.thailand.localize()
        case .turkey:
            return LocalizedString.turkey.localize()
        case .usa:
            return LocalizedString.usa.localize()
        case .southAfrica:
            return LocalizedString.southAfrica.localize()
        case .china:
            return LocalizedString.china.localize()
        case .czechRepublic:
            return LocalizedString.czechRepublic.localize()
        }
    }
}
