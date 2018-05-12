//
//  UIKit+Extensions.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit

public extension UITableView {
    public func registerNibForCell<T: UITableViewCell>(with cellType: T.Type) {
        register(UINib(nibName: String(describing: cellType), bundle: nil), forCellReuseIdentifier: String(describing: cellType))
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(with cellType: T.Type, forIndexPath indexPath: IndexPath) -> T {
        
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as! T
        return cell
    }
}
