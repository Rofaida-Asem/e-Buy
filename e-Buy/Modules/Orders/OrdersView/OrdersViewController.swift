//
//  OrdersViewController.swift
//  e-Buy
//
//  Created by Om Malikah  on 28/11/1443 AH.
//

import UIKit

class OrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var ordersTableView: UITableView!
    @IBOutlet weak var shippingToLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        
    }
    
    func registerCell(){
        let orderCell = UINib(nibName: "OrdersTableViewCell", bundle: nil)
        self.ordersTableView.register(orderCell, forHeaderFooterViewReuseIdentifier: "OrdersTableViewCell")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let orderCell = ordersTableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell", for: indexPath) as? OrdersTableViewCell else { return UITableViewCell() }
        
        return orderCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ordersTableView.bounds.height / 5
    }

}
