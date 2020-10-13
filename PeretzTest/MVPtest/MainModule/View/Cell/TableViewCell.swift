//
//  TableViewCell.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 20.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import UIKit
import SDWebImage

protocol MenuTableViewCellDelegate: class {
    func orderAdded(_ order: Model)
    func orderDeleted(_ order: Model)
}

class TableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var minusButtonOutlet: UIButton!
    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    //variables
    private var count = 0
    var presenter: TableViewCellPresetnerProtocol!
    var searchResponce: [Model]? = nil
    var model: Model?
    private let cartManager = CartManager.shared
    private var order: Model?
    private weak var delegate: MenuTableViewCellDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        minusButtonOutlet.isHidden = true
//        countLabel.isHidden = true
    }
    
    func configurate(with model: Model, count: Int?, delegate: MenuTableViewCellDelegate) {
        self.order = model
        self.delegate = delegate
        nameLabel.text = model.name
        priceLabel.text = "\(model.price) ₽"
        descriptionLabel.text = model.description
        productImageView.sd_setImage(with: URL(string: model.image), completed: nil)
        
        if let count = count {
            countLabel.text = String(count)
            self.count = count
        } else {
            minusButtonOutlet.isHidden = true
            countLabel.isHidden = true
        }
    }
    
    //MARK: - IBActions
    @IBAction func minusButton(_ sender: Any) {
//        if countValue >= 1 {
//            countValue -= 1
//            countLabel.text = String(countValue)
//
//        } else { return }
//
//        if countValue == 0 {
//            minusButtonOutlet.isHidden = true
//            countLabel.isHidden = true
//        }
        guard let order = self.order else { return }
        cartManager.minusDishes(order.id)
        count -= 1
        countLabel.text = String(count)
        if count == 0 {
            minusButtonOutlet.isHidden = true
            countLabel.isHidden = true
        }
        delegate.orderDeleted(order)
        
        
    }
    
    @IBAction func plusButton(_ sender: Any) {
//        if countValue == 0 {
//            minusButtonOutlet.isHidden = false
//            countLabel.isHidden = false
//        }
//
//        if countValue <= 98 {
//            countValue += 1
//            countLabel.text = String(countValue)
//
//        } else { return }
//
        
        guard let order = self.order else { return }
        cartManager.plusDishes(order.id)
        if count == 0 {
            minusButtonOutlet.isHidden = false
            countLabel.isHidden = false
        }
        count += 1
        countLabel.text = String(count)
        delegate.orderAdded(order)
        
        
    }
}


