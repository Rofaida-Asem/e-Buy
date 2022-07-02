//
//  RegisterVC.swift
//  e-Buy
//
//  Created by salah waleed on 27/06/2022.
//

import UIKit
import ProgressHUD
class RegisterVC: UIViewController {

    //MARK: - OuteLet
    var registerViewModel: RegisterViewModel? = RegisterViewModel()
    
    @IBOutlet weak var backVew: UIView!
    
    @IBOutlet weak var firstNameTf: UITextField!
   
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var passTf: UITextField!
    
    @IBOutlet weak var confirmPassTf: UITextField!
    
    @IBOutlet weak var regBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupui()
        registerViewModel?.bindingresult = {
            if self.registerViewModel?.done == true {
                ProgressHUD.showSuccess("Register successfuly")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    let login = LoginVC()
                    login.modalPresentationStyle = .fullScreen
                    self.present(login, animated: true)
                }
           
            }else{
                ProgressHUD.showError("Invalid Register")
            }
        }
    }

    func setupui(){
        backVew.layer.cornerRadius = 30
        self.backVew.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                self.backVew.layer.masksToBounds = true
 
 
        regBtn.layer.cornerRadius = regBtn.frame.height / 2 - 10
    }
    
    @IBAction func register(_ sender: UIButton) {
        if (firstNameTf.text != "") && (emailTf.text != "") && (passTf.text != "") && (confirmPassTf.text != ""){
            if passTf.text == confirmPassTf.text {
                guard let email = emailTf.text else {return}
                if email.isValidEmail {
                    registerViewModel?.register(FirstName: firstNameTf.text!, email: emailTf.text!, password: confirmPassTf.text!)
                }else{
                    ProgressHUD.showError("Enter Your Email correctly")
                }
         
            }else{
                ProgressHUD.showError("please confirm your password")
            }
        }else{
            ProgressHUD.showError("please fill all fields")
        }
    }
    
    
    
    

}
