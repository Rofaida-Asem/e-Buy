//
//  ShoppingCartViewController.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 27/06/2022.
//

import UIKit

class ShoppingCartViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func registerCell(){
        let cartCell = UINib(nibName: "ShoppingCartTableViewCell", bundle: nil)
        self.tableView.register(cartCell, forCellReuseIdentifier: "ShoppingCartTableViewCell")
        
    }

    
    @IBAction func checkoutButton(_ sender: UIButton) {
    }
    
   /* @objc func minusBtnTapped(sender:ImageButton){
        print("minus Btn ")
        print("indexPath is \(sender.indexPath)")
        let cell = cartItemsTableView.cellForRow(at: IndexPath(row: sender.indexPath.row, section: sender.indexPath.section)) as! CartItemTableViewCell
        if cell.amountLabel.text != "1"{
            let qty = String((Int(cell.amountLabel.text ?? "0") ?? 0) - 1)
            cell.amountLabel.text = qty
            let cartToBeUpdated = viewModel.getCellViewModel(at: sender.indexPath)
            
            let item = CartItem(name: cartToBeUpdated.name, price: cartToBeUpdated.price, imgUrl: cartToBeUpdated.imgUrl,id:cartToBeUpdated.id,qty: qty,variant_id: cartToBeUpdated.variant_id)
            CoreDataManager.shared.insertCartItem(cartItem: item,qtyTypeProcess: .subtraction)
            
            guard let price = Int(item.price) else {return}
            var  cash = Int(self.cashLabel.text!)!
            cash -= price
            self.cashLabel.text = "\(cash)"
            let imageIcon = UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .small))?.withTintColor(.red, renderingMode: .alwaysOriginal)
            cell.minusBtn.setImage(imageIcon, for: .normal)
            performAnimationForCartButtons(button: cell.minusBtn)
        } else {
            CartVC.presentAlertWithTwoActions(controller: self, title: "alert".localized, message: "Are you sure you want to delete item".localized, style: .alert, actionTitle: "OK".localized) { action in
                CartVC.showToast(controller: self, message: "item deleted successfully".localized, seconds: 1)
                self.viewModel.deleteItem(at: sender.indexPath)
                
            }
        }
        print("minus is : \(cell.amountLabel.text!)")
        let qty = String((Int(cell.amountLabel.text ?? "0") ?? 0) )
        if qty == "1"{
            let imageIcon = UIImage(systemName: "trash", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .small))?.withTintColor(.red, renderingMode: .alwaysOriginal)
            cell.minusBtn.setImage(imageIcon, for: .normal)
        }
        
    }
    
    @objc func plusBtnTapped(sender:ImageButton){
        print("plus Btn ")
        print("indexPath is \(sender.indexPath)")
        let cell = cartItemsTableView.cellForRow(at: IndexPath(row: sender.indexPath.row, section: sender.indexPath.section)) as! CartItemTableViewCell
        let qty = String((Int(cell.amountLabel.text ?? "0") ?? 0) + 1)
        cell.amountLabel.text = qty
        print("plus is : \(qty)")
        let cartToBeUpdated = viewModel.getCellViewModel(at: sender.indexPath)
        
        let item = CartItem(name: cartToBeUpdated.name, price: cartToBeUpdated.price, imgUrl: cartToBeUpdated.imgUrl,id:cartToBeUpdated.id,qty: qty,variant_id: cartToBeUpdated.variant_id)
        CoreDataManager.shared.insertCartItem(cartItem: item,qtyTypeProcess: .addition)
        
        guard let price = Int(item.price) else {return}
        var  cash = Int(self.cashLabel.text!)!
        cash += price
        self.cashLabel.text = "\(cash)"
        let imageIcon = UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .small))?.withTintColor(.red, renderingMode: .alwaysOriginal)
        cell.minusBtn.setImage(imageIcon, for: .normal)
        performAnimationForCartButtons(button: cell.plusBtn)
        
        
        
    } */
    
}
//MARK: - UITableViewDataSource

extension ShoppingCartViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cartCell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartTableViewCell") as? ShoppingCartTableViewCell
        else{ return UITableViewCell() }
//        cartCell.minusButton.indexPath = indexPath
//        cartCell.addButton.indexPath  = indexPath
//        cartCell.minusButton.addTarget(self, action: #selector(minusBtnTapped(sender:)), for: .touchUpInside)
//        cartCell.addButton.addTarget(self, action:#selector(plusBtnTapped(sender:)), for: .touchUpInside)

        
        return cartCell
    }
    
    
}
//MARK: - UITableViewDelrgate
extension ShoppingCartViewController: UITableViewDelegate {
    
    
}
