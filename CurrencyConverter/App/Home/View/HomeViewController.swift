//
//  HomeViewController.swift
//  CurrencyConverter
//
//  Created by Arturo on 5/12/18.
//  Copyright © 2018 AM. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol HomeViewControllerPresenter: class {
    func viewDidLoad(dataSource: HomeDataSource)
}

class HomeViewController: UIViewController {
    @IBOutlet private weak var selectCurrencyLabel: UILabel!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet private weak var pickerContainerView: UIView! {
        didSet {
            pickerContainerView.setupShadow(radius: 5.0, opacity: 0.2, offset: 1.2)
        }
    }
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var headerView: UIView! {
        didSet {
            headerView.setupShadow(radius: 5.0, opacity: 0.2, offset: 1.2)
        }
    }
    private let disposeBag = DisposeBag()
    private let presenter: HomeViewControllerPresenter
    private let dataSource = HomeDataSource()
    
    init(presenter: HomeViewControllerPresenter) {
        self.presenter = presenter
        
        super.init(nibName: String(describing: HomeViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad(dataSource: dataSource)
    }
}

private extension HomeViewController {
    func setupUI() {
        title = LocalizedString.home.localize()
        searchTextField.delegate = self
        dataSource.tableView = tableView
        dataSource.pickerView = pickerView
        selectCurrencyLabel.text = LocalizedString.selectCurrency.localize()
        doneButton.setTitle(LocalizedString.done.localize(), for: .normal)
        cancelButton.setTitle(LocalizedString.cancel.localize(), for: .normal)
    
        bind()
    }
    
    func bind() {
        searchButton
            .rx
            .tap
            .debounce(0.4, scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                self?.showPicker(true)
            }).disposed(by: disposeBag)
        
        cancelButton
            .rx
            .tap
            .debounce(0.4, scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                self?.showPicker(false)
            }).disposed(by: disposeBag)
        
        doneButton
            .rx
            .tap
            .debounce(0.4, scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                self?.showPicker(false)
                self?.updateCurrency()
            }).disposed(by: disposeBag)
        
        dataSource
            .currentCurrency
            .asObservable()
            .subscribe(onNext: { [weak self] (currency) in
                self?.searchButton.setTitle(currency.rawValue, for: .normal)
                self?.pickerView.selectRow(0, inComponent: 0, animated: false)
            })
            .disposed(by: disposeBag)
    }
    
    func showPicker(_ show: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.pickerContainerView.alpha = show ? 1.0 : 0.0
        }
    }
    
    func updateCurrency() {
        let row = pickerView.selectedRow(inComponent: 0)
        dataSource.updateCurrency(with: row)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text: NSString = (textField.text as? NSString) ?? ""
        let newString = text.replacingCharacters(in: range, with: string)
        guard string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil && newString.count < 20 else {
            return false
        }
                
        if let value = Int(newString) {
            dataSource.updateMultiplier(multiplier: value)
        } else {
            dataSource.updateMultiplier(multiplier: 1)
        }
        return true
    }
}

