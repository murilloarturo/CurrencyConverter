//
//  HomeDataSource.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit
import RxSwift

class HomeDataSource: NSObject {
    private let disposeBag = DisposeBag()
    let currentCurrency = Variable<CurrencyCode>(.usa)
    private var multiplier: Int = 1
    var data: CurrencyRateData? {
        didSet {
            pickerView?.reloadComponent(0)
            tableView?.reloadData()
        }
    }
    weak var tableView: UITableView? {
        didSet {
            tableView?.registerNibForCell(with: CurrencyRateTableViewCell.self)
            tableView?.dataSource = self
            tableView?.delegate = self
        }
    }
    weak var pickerView: UIPickerView! {
        didSet {
            pickerView.dataSource = self
            pickerView.delegate = self
        }
    }
    
    func currencies() -> [CurrencyCode] {
        guard let data = data else {
            return []
        }
        return data.rates.map{ $0.currency }
    }
    
    func updateCurrency(with row: Int) {
        let items = currencies()
        guard row >= 0 && row < items.count else {
            return
        }
        currentCurrency.value = items[row]
    }
    
    func currentRow() -> Int {
        let items = currencies()
        let index = items.index(of: currentCurrency.value)
        return index ?? 0
    }
    
    func updateMultiplier(multiplier: Int) {
        let newMultiplier = multiplier < 0 ? 1 : multiplier
        self.multiplier = newMultiplier
        tableView?.reloadData()
    }
}

extension HomeDataSource: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let data = data, !data.rates.isEmpty else {
            return 0
        }
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = data else {
            return 0
        }
        
        switch section {
        case 0:
            return data.primaryRates.count
        default:
            return data.otherRates.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: CurrencyRateTableViewCell.self, forIndexPath: indexPath)
        if let data = data {
            let section = indexPath.section
            let item: CurrencyRate
            switch section {
            case 0:
                item = data.primaryRates[indexPath.row]
            default:
                item = data.otherRates[indexPath.row]
            }
            
            let rate = Double(multiplier) * item.rate
            cell.currencyExchangeLabel.text = "\(rate) \(item.currency.rawValue)"
            cell.currencyDescriptionLabel.text = item.currency.rawValue
            cell.currencyRateLabel.text = "1 \(currentCurrency.value.rawValue) = \(item.rate) \(item.currency.rawValue)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section != 0 else {
            return 0
        }
        
        return 25.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section != 0 else {
            return nil
        }
        
        let label = UILabel(frame: .zero)
        label.text = LocalizedString.others.localize()
        label.textColor = .darkGray
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        return label
    }
}

extension HomeDataSource: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 25
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies()[row].rawValue
    }
}
