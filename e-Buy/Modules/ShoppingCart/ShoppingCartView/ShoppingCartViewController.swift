//
//  ShoppingCartViewController.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 27/06/2022.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var cartTableView: UITableView!
    let viewModel        = CartViewModel()
    let addressViewModel = AddressViewModel()
    var addressIndexPath:IndexPath!
    var addressToSave: AddressCellViewModel!
    var cartItemPrice = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchCartItems()
    }
    
    
    func registerCell(){
        let cartCell = UINib(nibName: "ShoppingCartTableViewCell", bundle: nil)
        self.cartTableView.register(cartCell, forCellReuseIdentifier: "ShoppingCartTableViewCell")
    }
    
    func update(){
        
        viewModel.reloadTableViewClosure = {
            print("reload table view executed")
            self.cartTableView.reloadData()
        }
        viewModel.updateCashPriceLabel = {
            DispatchQueue.main.async {
                self.totalLabel.text      = "\(self.viewModel.totalPrice)"
            }
        }
    }
    
    
    @IBAction func checkoutButton(_ sender: UIButton) {
        pushPaymentVC()
    }
    func pushPaymentVC(){
        
        if addressViewModel.numberOfCells > 0 {
            let paymentVC = PaymentViewController()
            self.navigationController?.pushViewController(paymentVC, animated: true)
        }else{
            presentAlert(controller: self, title: "Error", message: "Somthing went wrong", style: .alert, actionTitle: "OK") { action in
                self.dismiss(animated: true)
            }
            
        }
    }
    
}

func presentAlert(controller: UIViewController,title:String, message: String,style:UIAlertController.Style,actionTitle:String,action:@escaping (_ action:UIAlertAction)->Void){
    let alert = UIAlertController(title: title, message: message, preferredStyle:style )
    alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: action))
    controller.present(alert, animated: true, completion: nil)
}
//MARK: - UITableViewDataSource

extension ShoppingCartViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cartCell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartTableViewCell") as? ShoppingCartTableViewCell
        else{
            return UITableViewCell()
            
        }
        
        return cartCell
    }
}
//MARK: - UITableViewDelegate
extension ShoppingCartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.00
    }
    
}
