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
    
}
//MARK: - UITableViewDataSource

extension ShoppingCartViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cartCell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartTableViewCell") as? ShoppingCartTableViewCell
        else{ return UITableViewCell() }
        
        return cartCell
    }
    
    
}
//MARK: - UITableViewDelrgate
extension ShoppingCartViewController: UITableViewDelegate {
    
    
}
