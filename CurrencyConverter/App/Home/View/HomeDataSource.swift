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
    var data: CurrencyRateData? {
        didSet {
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
}

extension HomeDataSource: UITableViewDataSource {
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
            cell.update(with: item)
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

extension HomeDataSource: UITableViewDelegate { }
