//
//  PaymentViewController.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 28/06/2022.
//

import UIKit

var rowsWhichAreChecked = [NSIndexPath]()
class PaymentViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var onlinePayment = ["Apple Pay"]
    var offlinePayment = ["Cash on delivery"]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        
    }


    
    @IBAction func continueToPaymentButton(_ sender: UIButton) {
        
    }
    
}
//MARK: - UITableViewDataSource
extension PaymentViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0){
            
            return onlinePayment.count
            
        } else {
            
            return offlinePayment.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentTableViewCell") as! PaymentTableViewCell
        
        if (indexPath.section == 0) {
            cell.paymentLabel.text = self.onlinePayment[indexPath.row]
        }
        else {
            cell.paymentLabel.text = self.offlinePayment[indexPath.row]
        }
        
        let isRowChecked = rowsWhichAreChecked.contains(indexPath as NSIndexPath)
        
        if(isRowChecked == true)
        {
            cell.checkButton.isChecked = true
            cell.checkButton.buttonClicked(sender: cell.checkButton)
        } else {
            cell.checkButton.isChecked = false
            cell.checkButton.buttonClicked(sender: cell.checkButton)
        }
    
    return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableView.cellForRow(at: indexPath as IndexPath) as! PaymentTableViewCell
        cell.contentView.backgroundColor = UIColor.white
       
        if(rowsWhichAreChecked.contains(indexPath as NSIndexPath) == false){
            cell.checkButton.isChecked = true
            cell.checkButton.buttonClicked(sender: cell.checkButton)
    }
}
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath) as! PaymentTableViewCell
        cell.checkButton.isChecked = false
        cell.checkButton.buttonClicked(sender: cell.checkButton)
    
        if let checkedItemIndex = rowsWhichAreChecked.firstIndex(of: indexPath as NSIndexPath){
            rowsWhichAreChecked.remove(at: checkedItemIndex)
      }
        
   }
 
}

//MARK: - UITableViewDelegate
extension PaymentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100.00
    }
}
