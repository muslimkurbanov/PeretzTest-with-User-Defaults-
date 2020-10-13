//
//  TableViewCellPresenter.swift
//  MVP-PeretzTest
//
//  Created by Муслим Курбанов on 01.10.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import Foundation

protocol TableViewCellProtocol: class {
    
}


protocol TableViewCellPresetnerProtocol: class {
    init(view: TableViewCellProtocol, networkService: NetworkServiceProtocol)
}

class TableViewCellPresenter: TableViewCellPresetnerProtocol {

    weak var view: TableViewCellProtocol?
    
    let networkService: NetworkServiceProtocol!
    
    required init(view: TableViewCellProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        
    }
}
