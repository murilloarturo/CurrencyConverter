
//
//  CurrencyRateTableViewCell.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit

class CurrencyRateTableViewCell: UITableViewCell {
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var currencyExchangeLabel: UILabel!
    @IBOutlet weak var currencyDescriptionLabel: UILabel!
    @IBOutlet weak var currencyRateLabel: UILabel!
    
    
    func update(with rate: CurrencyRate) {
        currencyDescriptionLabel.text = rate.currency.rawValue
        currencyRateLabel.text = "\(rate.rate) \(rate.currency.rawValue)"
    }
}
