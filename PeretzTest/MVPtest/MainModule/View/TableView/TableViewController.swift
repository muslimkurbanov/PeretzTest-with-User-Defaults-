//
//  TableViewController.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 21.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import UIKit

protocol TableViewProtocol: class {
    func applyData(model: [Model])
    func failure(error: Error)
}

class TableViewController: UITableViewController {
    
    var searchResponse = [Model]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var presenter: TableViewPresetnerProtocol!
    private let cartManager = CartManager.shared

    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MainTableViewPresenter(view: self)
//        
//        self.tabBarController?.title = "TEST"
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "arrow-left")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "arrow-left")
        //        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        //        tableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
    
    // MARK: - TableViewDelegate(DataSource)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResponse.count
        
    }
    //cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        let item = searchResponse[indexPath.row]

        let count = cartManager.getDishCount(by: item.id)
        cell.configurate(with: item, count: count, delegate: self)
                
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
//MARK: TableViewProtocol
extension TableViewController: TableViewProtocol {
    
    func applyData(model: [Model]) {
        searchResponse.append(contentsOf: model)
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
}

extension TableViewController: MenuTableViewCellDelegate {
    func orderAdded(_ order: Model) {
        
        guard cartManager.dishesIds.count < 2 else { return }
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
//            self.view.layoutIfNeeded()
//        })
    }
    
    func orderDeleted(_ order: Model) {
        guard cartManager.dishesIds.count == 0 else { return }
//        UIView.animate(withDuration: 0.4, animations: {
//            self.view.layoutIfNeeded()
//        })
    }
    
    
}

