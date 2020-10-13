//
//  Presenter.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 20.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//
//MARK: - MainPresenter

import Foundation

protocol ViewProtocol: class {
    func configurate(viewController: ViewController)
}

protocol ViewPresetnerProtocol: class {
    init(view: ViewProtocol)
}

class MainPresenter: ViewPresetnerProtocol {
    
    var main = ViewController()
    weak var view: ViewProtocol?
    
    required init(view: ViewProtocol) {
        self.view = view
        
    }
}
