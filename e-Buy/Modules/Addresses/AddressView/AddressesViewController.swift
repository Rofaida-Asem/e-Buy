//
//  AddressViewController.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 02/07/2022.
//

import UIKit

class AddressesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addressTableView: UITableView!
    @IBOutlet weak var addNewAddressButton: UIButton!
    let networkShared = ApiService.shared
    let userDefaults = UserDefaults.standard
    var userId = 0
    var addressId = 0
    var allAddressesArray: [Addresses] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userId = userDefaults.object(forKey: "userId") as? Int ?? 0
        
        networkShared.getDataFromApi(urlString: allAddresses(userId: userId), baseModel: AddressesContract.self) { (result) in
            switch result {
            case .success(let data):
                if let allAdds = data.addresses {
                    //print(allAdds)
                    self.allAddressesArray = allAdds
                }
                DispatchQueue.main.async {
                    self.addressTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func registerCell(){
        let addressCell = UINib(nibName: "AddressTableViewCell", bundle: nil)
        self.addressTableView.register(addressCell, forCellReuseIdentifier: "AddressTableViewCell")
    }
    @IBAction func addNewAddressButton(_ sender: Any){
        let addAddressVC = AddAddressViewController(nibName: "AddAddressViewController", bundle: nil)
        navigationController?.pushViewController(addAddressVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allAddressesArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 185
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let addressCell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell") as? AddressTableViewCell else{return UITableViewCell()}

        addressCell.name.text = allAddressesArray[indexPath.row].name
        addressCell.phoneNumber.text = allAddressesArray[indexPath.row].phone
        addressCell.country.text = "\(allAddressesArray[indexPath.row].city ?? "") , \(allAddressesArray[indexPath.row].country ?? "")"
        addressCell.address.text = allAddressesArray[indexPath.row].address1
        
        return addressCell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if indexPath.row == 0 {
                displayAlert(title: "DELETE", message: "You Can't Delete This Address")
            }else{
                displayAlertTwoAction(title: "DELETE", message: "Are You Sure You Want To Delete This Address?", action: UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
                    
                    tableView.beginUpdates()
                    tableView.deleteRows(at:[indexPath], with: .automatic)
                    
                    self.addressId = self.allAddressesArray[indexPath.row].id
                    self.allAddressesArray.remove(at: indexPath.row)
                    self.networkShared.deleteAddress(userId: self.userId, addressId: self.addressId) { (data, response, error) in
                        let json = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String,Any>
                        if json.isEmpty {
                            print("deleted")
                        }else{
                            print("cant delete")
                        }
                    }
                    
                    tableView.endUpdates()
                    tableView.reloadData()
                    
                }))
                
            }
        }
    }
    
    func displayAlert(title: String,message: String) {
        let alert = UIAlertController(title: title,message:message,preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func displayAlertTwoAction(title: String,message: String, action: UIAlertAction) {
        let alert = UIAlertController(title: title,message:message,preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel",style: .default, handler: nil))
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}



