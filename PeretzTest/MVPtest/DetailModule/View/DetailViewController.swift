//
//  DetailViewController.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 22.06.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    var presenter: DetailViewPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: [Model]?) {
//        commentLabel.text = commen
    }
    
}

