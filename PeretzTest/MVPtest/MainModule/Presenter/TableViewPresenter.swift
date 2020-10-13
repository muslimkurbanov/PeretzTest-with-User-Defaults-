//
//  TableViewPresenter.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 21.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import Foundation

protocol TableViewPresetnerProtocol: class {
    init(view: TableViewProtocol)
    func getMenu()
}

final class MainTableViewPresenter: TableViewPresetnerProtocol {
    
    private var searchResponce: [Model]? = nil
    private var main = TableViewController()
    private let networkService: NetworkServiceProtocol = NetworkService()
    
    private weak var view: TableViewProtocol?
    
    required init(view: TableViewProtocol) {
        self.view = view
        self.getMenu()
    }

    func getMenu() {
        
        networkService.getMenu { [weak self] result in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let searchResponce):
                    
                    self.searchResponce = searchResponce
                    self.view?.applyData(model: searchResponce!)
                    
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
}
