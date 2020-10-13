//
//  DetailPresenter.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 22.06.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import Foundation

protocol DetailViewProtocol: class {
    func setComment(comment: [Model]?)
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: [Model]?)
    func setComment()
    
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
       let networkService: NetworkServiceProtocol!
       var comment: [Model]?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: [Model]?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    
}
