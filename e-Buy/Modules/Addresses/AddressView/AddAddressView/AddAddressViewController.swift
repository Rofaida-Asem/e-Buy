//
//  AddAddressViewController.swift
//  e-Buy
//
//  Created by Amr Abdelnasser on 03/07/2022.
//

import UIKit

class AddAddressViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var cityCountryTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    let userDefaults = UserDefaults.standard
    let networkShared = ApiService.shared
    var isDefaultAddress = false
    var userId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userId = userDefaults.object(forKey: "userId") as? Int ?? 0
        print(userId)
        // Do any additional setup after loading the view.
    }


    
    @IBAction func saveButton(_ sender: UIButton) {
        
        let address = Addresses(address1: addressTextField.text, province: "", phone: phoneNumTextField.text,  name: nameTextField.text, country: cityCountryTextField.text)
        addAddress(address: address)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        switch textField {
        case addressTextField:
            if !text.isEmpty {
                print("Typing")
            }else{
                addressTextField.text = "Please enter your address"
            }
        
        case nameTextField:
            if !text.isEmpty {
                print("Typing")
            }else{
                nameTextField.text = "Please enter a name"
            }
        case phoneNumTextField:
            if !text.isEmpty {
                print("Typing")
            }else{
                phoneNumTextField.text = "Please enter a receiver mobile number"
            }
        case addressTextField:
            print("")
        default:
            textField.text = ""
        }
        return true
    }
    
    func addAddress(address: Addresses){
        var newAddress = address
        print(userId)
        networkShared.addAddress(id: userId, address: address) { [weak self] (data, response, error) in
            if error != nil {
                print("error while adding address \(error!)")
                return
            }
            if let data = data{
                let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String,Any>
                let returnedCustomer = json["customer"] as? Dictionary<String,Any>
                do{
                    let returnedCust = try JSONDecoder().decode(CustomarContract.self, from: data)
                    
                    newAddress.id = returnedCust.customer?.addresses?.last?.id ?? 0
                }catch{
                    print("could parse response: \(error.localizedDescription)")
                }
                let id = returnedCustomer?["id"] as? Int ?? 0
                // let addresses = returnedCustomer?["addresses"] as? Int ?? 0
                if id == 0 {
                    DispatchQueue.main.async {
                        self?.displayAlert(title: "user not supported", message: "An error occured while adding your address")
                    }
                }else {
                    DispatchQueue.main.async {
                        self?.navigationController?.popViewController(animated: true)
                    }
                    
                }
            }
        }
    }
    func displayAlert(title: String,message: String) {
        let alert = UIAlertController(title: title,message:message,preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
