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
    
    func localize() -> String {
        return NSLocalizedString(rawValue, comment: "")
    }
}
