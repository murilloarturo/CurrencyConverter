//
//  UIKit+Extensions.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit

extension UIView {
    func setupShadow(radius: CGFloat, opacity: CGFloat, offset: CGFloat) {
        layer.shadowOffset = CGSize(width: 0, height: offset)
        layer.shadowRadius = radius
        layer.shadowOpacity = Float(opacity)
        layer.masksToBounds = false
    }
}

public extension UITableView {
    public func registerNibForCell<T: UITableViewCell>(with cellType: T.Type) {
        register(UINib(nibName: String(describing: cellType), bundle: nil), forCellReuseIdentifier: String(describing: cellType))
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(with cellType: T.Type, forIndexPath indexPath: IndexPath) -> T {
        
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as! T
        return cell
    }
}
